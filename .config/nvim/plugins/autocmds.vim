" this will be run automatically on saving java file
autocmd BufWritePost            *.java !javac --source-path "./src/main/java" -cp "./target/classes" -d "./target/classes" <afile>