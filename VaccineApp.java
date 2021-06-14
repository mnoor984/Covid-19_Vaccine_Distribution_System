import java.sql.* ;
import java.util.Scanner;

class VaccineApp
{
    public static void main ( String [ ] args ) throws SQLException
    {

        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
            tableName += "test";

        // Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }

        // This is the url you must use for DB2.
        //Note: This url may not valid now !
        String url = "jdbc:db2://winter2021-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = "mnoor2";
        String your_password = "qNV8dk3U";
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        Statement statement = con.createStatement ( ) ;

        // ----------------------------------------------------------------------------------------------------------


        int var = 1;
        Scanner scanner = new Scanner(System.in);

        while( var != 0) {

            System.out.println();
            System.out.println("VaccineApp Main Menu");
            System.out.println("    1. Add a person");
            System.out.println("    2. Assign a slot to a Person");
            System.out.println("    3. Enter Vaccination Information");
            System.out.println("    4. Exit Application");
            System.out.println();
            System.out.println("Please Enter Your Option:");
            int option = scanner.nextInt();
            scanner.nextLine();


            // Add a Person
            if (option == 1) {
                System.out.println();
                System.out.println("Option Selected: Add a Person");
                System.out.println("Enter Health Insurance Number:");
                int hinsurnum = scanner.nextInt();
                System.out.println("Enter first and last name:");
                scanner.nextLine();
                String personname = scanner.nextLine();
                System.out.println("Enter gender:");
                String gender = scanner.nextLine();
                System.out.println("Enter date of birth:");
                String dob = scanner.nextLine();
                System.out.println("Enter phone number:");
                long phonenum = scanner.nextLong();
                System.out.println("Enter city:");
                scanner.nextLine();
                String city = scanner.nextLine();
                System.out.println("Enter postal code:");
                String postalcode = scanner.nextLine();
                System.out.println("Enter street address:");
                String streetaddr = scanner.nextLine();
                System.out.println("Enter registration date:");
                String regdate = scanner.nextLine();
                System.out.println("Enter category name:");
                String cname = scanner.nextLine();


                // Inserting Person into table
                try {
                    System.out.println();
                    String insertSQL = "INSERT INTO PERSON VALUES (" + hinsurnum + ",'" + personname + "','" + gender + "','" + dob + "'," + phonenum + ",'" + city + "','" + postalcode + "','" + streetaddr + "','" + regdate + "','" + cname + "')";
                    System.out.println(insertSQL);
                    statement.executeUpdate(insertSQL);
                    System.out.println("DONE");

                } catch (SQLException e) {

                    if (e.getMessage().equals("DB2 SQL Error: SQLCODE=-803, SQLSTATE=23505, SQLERRMC=1;MNOOR2.PERSON, DRIVER=4.27.25")) {
                        System.out.println();
                        System.out.println("Person with Health Insurance Number " + hinsurnum + " already exists");
                        System.out.println("Would you like to update this existing persons information with the one you entered? Enter yes or no");
                        String response = scanner.nextLine();


                        if (response.equals("yes")) {

                            //Delete Person record with specific hinsurnum
                            try {
                                String deleteSQL = "DELETE FROM PERSON WHERE hinsurnum = " + hinsurnum;
                                System.out.println(deleteSQL);
                                statement.executeUpdate(deleteSQL);
                                System.out.println("DONE");

                            } catch (SQLException e1) {
                                sqlCode = e1.getErrorCode(); // Get SQLCODE
                                sqlState = e1.getSQLState(); // Get SQLSTATE

                                // Your code to handle errors comes here;
                                // something more meaningful than a print would be good
                                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                                System.out.println(e1);
                            }

                            // Insert Person with specific hinsurnum
                            try {
                                String insertSQL = "INSERT INTO PERSON VALUES (" + hinsurnum + ",'" + personname + "','" + gender + "','" + dob + "'," + phonenum + ",'" + city + "','" + postalcode + "','" + streetaddr + "','" + regdate + "','" + cname + "')";
                                System.out.println(insertSQL);
                                statement.executeUpdate(insertSQL);
                                System.out.println("DONE");


                            } catch (SQLException e2) {
                                sqlCode = e2.getErrorCode(); // Get SQLCODE
                                sqlState = e2.getSQLState(); // Get SQLSTATE

                                // Your code to handle errors comes here;
                                // something more meaningful than a print would be good
                                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                                System.out.println(e2);
                            }

                        } // end of if

                        else {
                            // return to main menu
                            System.out.println();
                            System.out.println("Returning to Main menu");

                        } // end of else
                    } // end of if

                } // end of catch

            } // end of if (option == 1)

            // Assign a slot to a Person
            else if (option == 2) {

                System.out.println();
                System.out.println("Option Selected: Assign a slot to a Person");
                System.out.println("Enter Health Insurance Number of the person: ");
                String hinsurnum = scanner.nextLine();
                System.out.println("Enter Location Name:");
                String locationname = scanner.nextLine();
                System.out.println("Enter Vaccination Date:");
                String vdate = scanner.nextLine();
                System.out.println("Enter Vaccination Time:");
                String vtime = scanner.nextLine();
                System.out.println("Enter Vaccination Slot (Tent number): ");
                int vslot = scanner.nextInt();
                scanner.nextLine();
                System.out.println("Enter Assignment Date:");
                String asgndate = scanner.nextLine();



                // Check if the person has already received a vaccine shot, if so, what is the recommended number of doses of that vaccine.
                String querySQL = "SELECT  DISTINCT VACCINE.NUMDOSES FROM VACCINE, VACCSLOT WHERE VACCINE.VNAME = VACCSLOT.VNAME AND VACCSLOT.HINSURNUM = " + hinsurnum +"";
                java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;

                int numdoses_recommended = 0; // will remain 0 if the person has not been vaccinated at least once
                int numslots_already_assigned = 0; // will remain 0 if the person has not been assigned at least one slot

                while ( rs.next ( ) )
                {
                    numdoses_recommended = rs.getInt ( "NUMDOSES" ) ;
                    System.out.println("Num of doses recommended: " + numdoses_recommended);

                }

                // Check how many slots the person has been assigned already
                querySQL = "SELECT COUNT(*) AS NUMDOSERECEIVED FROM VACCSLOT WHERE HINSURNUM = " + hinsurnum +"";
                rs = statement.executeQuery ( querySQL ) ;

                while ( rs.next ( ) )
                {
                    numslots_already_assigned = rs.getInt ( "NUMDOSERECEIVED" ) ;
                    System.out.println("Num of doses received: " + numslots_already_assigned);

                }

                if (numdoses_recommended == numslots_already_assigned && numdoses_recommended != 0 && numslots_already_assigned != 0) {
                    System.out.println();
                    System.out.println("This person has already received the recommended number of doses");
                    continue;
                }

                else if (numdoses_recommended == 0 && numslots_already_assigned != 0) {
                    System.out.println("This person has not been vaccinated yet, but a slot for the first vaccination has already been assigned to him/her");
                    System.out.println("Please assign another slot to this person (if needed), when the person receives his/her first vaccine shot");
                    continue;
                }

                else if(numdoses_recommended != 0 && numslots_already_assigned != 0 && numdoses_recommended > numslots_already_assigned){
                    System.out.println("Number of recommended doses is greater than the number of slots assigned so far");
                    System.out.println("Proceeding to assigning a slot for this person");
                }

                else {
                    System.out.println("This person has neither slots assigned for him/her, nor has this person been vaccinated even once");
                    System.out.println("Proceeding to assigning a slot for this person");
                }

                // check if the slot has already been assigned to someone
                querySQL = "SELECT  * FROM VACCSLOT WHERE LOCATIONNAME= '" +locationname+"' AND VDATE = '"+vdate+"' AND VTIME = '"+vtime+"' AND VSLOT = "+vslot+"";
                rs = statement.executeQuery ( querySQL ) ;

                String empty_string = null;

                while ( rs.next ( ) )
                {
                     empty_string = rs.getString ( "HINSURNUM" ) ;
                }

                if (empty_string != null) {
                    System.out.println("This slot is already assigned to another person");
                    continue;
                }

                try {

                    System.out.println();
                    String updateSQL = "UPDATE VACCSLOT SET HINSURNUM = " + hinsurnum + ",ASGNDATE = '"+ asgndate + "' WHERE  LOCATIONNAME= '" +locationname+"' AND VDATE = '"+vdate+"' AND VTIME = '"+vtime+"' AND VSLOT = "+vslot+"";
                    System.out.println(updateSQL);
                    statement.executeUpdate(updateSQL);
                    System.out.println("DONE");


                } catch (SQLException e) {
                    sqlCode = e.getErrorCode(); // Get SQLCODE
                    sqlState = e.getSQLState(); // Get SQLSTATE

                    // Your code to handle errors comes here;
                    // something more meaningful than a print would be good
                    System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                    System.out.println(e);

                }
            } // end of else if (option == 2)

            // Enter Vaccination information
            else if (option == 3) {
                System.out.println("Option Selected: Enter Vaccination Information");
                System.out.println("Enter Health Insurance Number of person");
                String hinsurnum = scanner.nextLine();
                System.out.println("Enter Location Name:");
                String locationname = scanner.nextLine();
                System.out.println("Enter Vaccination Date:");
                String vdate = scanner.nextLine();
                System.out.println("Enter Vaccination Time:");
                String vtime = scanner.nextLine();
                System.out.println("Enter Vaccination Slot (Tent number): ");
                int vslot = scanner.nextInt();
                System.out.println("Enter Nurse License Number:");
                int cnln = scanner.nextInt();
                scanner.nextLine();
                System.out.println("Enter Vaccine name:");
                String vname = scanner.nextLine();
                System.out.println("Enter Batch number:");
                int batchnum = scanner.nextInt();
                System.out.println("Enter Vial number:");
                int vialid = scanner.nextInt();
                scanner.nextLine();

                // Check if the person has already received a vaccine shot, if so, what was the vaccine name
                String querySQL = "SELECT DISTINCT VACCSLOT.VNAME FROM VACCSLOT WHERE VACCSLOT.HINSURNUM = " + hinsurnum +" AND VACCSLOT.VNAME IS NOT NULL";
                java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;

                String vaccine_name = null;

                while ( rs.next ( ) )
                {
                    vaccine_name = rs.getString ( "VNAME" ) ;

                }

                if (vaccine_name == null) {
                    System.out.println("The person has not been vaccinated before");
                    System.out.println("Proceeding as normal");
                }

                else if (!vaccine_name.equals(vname)) {

                    System.out.println("Person was previously given vaccine of type: "+ vaccine_name);
                    System.out.println("Therefore, the person cannot be given a vaccine of the following type: "+ vname);
                    continue;
                }


                try {
                    String updateSQL = "UPDATE VACCSLOT SET CNLN = " + cnln + ",VNAME = '" + vname + "',BATCHNUM = " + batchnum + ",VIALID = " + vialid + " WHERE  LOCATIONNAME= '" + locationname + "' AND VDATE = '" + vdate + "' AND VTIME = '" + vtime + "' AND VSLOT = " + vslot + "";
                    System.out.println(updateSQL);
                    statement.executeUpdate(updateSQL);
                    System.out.println("DONE");
                }
                catch (SQLException e) {
                    System.out.println("error");
                }

            } // end of else if (option == 3)


            // Exit Application
            else if (option == 4) {
                System.out.println();
                System.out.println("Exiting Application");
                scanner.close();
                var = 0;
            } // end of else if (option == 4)


        } // end of while( var != 0)

        /**
         *  **********************************************
         */

        // Finally but importantly close the statement and connection
        statement.close ( ) ;
        con.close ( ) ;
    }
}
