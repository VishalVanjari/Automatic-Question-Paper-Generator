package com.quegen.db;
import java.util.HashMap;
import java.util.Map;

import java.sql.*;
public class DBUtil {
//    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/que_gen";
//    private static final String USERNAME = "root";
//    private static final String PASSWORD = "";
	public static int assignWeightageToQuestion(String question) {
        // Define question types and corresponding weightage
        Map<String, Integer> questionTypes = new HashMap<>();
        questionTypes.put("what", 5);
        questionTypes.put("which", 5);
        questionTypes.put("who", 5);
        questionTypes.put("whom", 5);
        questionTypes.put("whose", 5);
        questionTypes.put("when", 5);
        questionTypes.put("where", 5);
        questionTypes.put("why", 5);
        questionTypes.put("how", 10); // Assigning weightage 10 to "how questions"
        questionTypes.put("describe", 10); // Assigning weightage 10 to "descriptive questions"
        questionTypes.put("explain", 10); // Assigning weightage 10 to "explanatory questions"
        questionTypes.put("elaborate", 10); // Assigning weightage 10 to "elaborate questions"
        questionTypes.put("tell", 10); // Assigning weightage 10 to "tell questions"
        questionTypes.put("discuss", 10); // Assigning weightage 10 to "discuss questions"
        // Add more question types and weightage as needed
       
        // Add more question types and weightage as needed

        // Tokenize the question
        String[] tokens = question.split("\\s+");

        // Initialize overall weightage
        int overallWeightage = 0;

        // Check for keywords and assign weightage
        for (String token : tokens) {
            for (Map.Entry<String, Integer> entry : questionTypes.entrySet()) {
                String qType = entry.getKey();
                int weightage = entry.getValue();
                if (token.toLowerCase().contains(qType)) {
                    overallWeightage += weightage;
                    break; // Break out of the inner loop if the question type is identified
                }
            }
        }

        return overallWeightage;
    }
	
	
    public static void saveQuestions(String unit, String[] questions,int tid) {
        try  {
        	Connection con = ConnectDB.getConnect();
            String insertQuery = "INSERT INTO questions (unit, question,t_id,weightage) VALUES (?, ?,?,?)";
            PreparedStatement statement = con.prepareStatement(insertQuery);
System.out.println("again helooooooo");
            for (String question : questions) {
            	 if (question == null) {
                     // Handle the null question as needed
                     continue; // Skip to the next question if the current question is null
                 }

            	int weightage = assignWeightageToQuestion(question);
            	System.out.println(weightage);
            	statement.setString(1, unit);
                statement.setString(2, question);
                statement.setInt(3, tid);
                statement.setInt(4, weightage);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception or log the error as needed
        }
    }
}
