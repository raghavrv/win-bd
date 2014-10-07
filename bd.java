public class bd {

    public static void main(String[] args) {

        try {
                String currentDirectory = System.getProperty("user.dir").toLowerCase();
                currentDirectory = currentDirectory.substring(0, currentDirectory.lastIndexOf("\\") + 1); // Removing the current working directory from the path

                String searchString = "\\" + args[0].toLowerCase().replaceAll("\"","");

                int index = ("\\" + currentDirectory).lastIndexOf(searchString); // The back slash added at the start is to match the root if searched for

                if ( index == -1 )
                    return;
                
                System.out.print("\"" + currentDirectory.substring(0, currentDirectory.indexOf("\\",index)) + "\\\"");

        }
                        
        catch ( Exception e )
        {
            // Exit without any error messages.
        }
    }
}
