ALTER DATABASE database
{ ADD FILE < filespec > [....n] 
[ O FILEGROUP filegroup_name ]
              ADD LOG FILE < filespec > [....n]
              REMOVE FILE logical-file-name
              ADD FILEGROUP filegroup-name
              REMOVE FILEGROUP filegroup-name
              MODIFY FILE < filespec >
              MODIFY NAME = new_dbname
              MODIFY FILEGROUP filegoup_name { filegoup_property | NAME new_filegroup_name }
             
