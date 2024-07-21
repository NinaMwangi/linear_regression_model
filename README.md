Summative Assignment
Task 1: Linear Regression

You will be working on a linear regression model in the following tasks:
Creating and Optimizing a linear regression model using gradient descent.
You have been provided a data set that will create a model that predicts TV sales.
Please find all resources associated with this link - Please make a copy first.
Inside you will find a notebook which has instructions.
Make sure to note down all cells that require you to complete the code snippets. The notebook has unit tests that you will have to pass.
The Notebook has 5 Exercises
Create decision trees and random Forests models compare the Root Mean Squared Errors to the Linear regression model, and rank the models accordingly
Here is a cheat sheet - Link
Task 2: Create an API

Create a function to make a prediction using a Linear regression model, that is a Python function as follows. Use Fast API to create an API endpoint and upload source code files to a free hosting platform (or paid where possible)
Ensure that this task uses a different dataset that has multiple variables. Different from task 1.
#import things. . . …..
app = FastAPI(‘insert something here)
@app.post(‘/predict’)
def predict(*args, **kwargs):
  #insert your code here
  return prediction
#replace *args and **kwargs where you deem necessary
Task 3: Flutter app

Use the API endpoint created in task 2,that is, url + path_to_predict on your flutter app.
Your app  should have at least one 1page with the following:
TextFields for inputting values needed for the prediction.
A Button with the text "Predict".
A display area for showing the predicted value or an error message if the values are out of range or if one or more expected values are missing.
Submission Requirements:
 
A GitHub link containing the notebook, API code files, and Flutter app with directories well labeled ** empty cell outputs on the notebook will be considered failed run outputs**
On the README :
Provide a publicly available API endpoint that returns predictions given input values. Tests will be assessed using Postman, alternatively, you can provide steps to access the API.
A video demo of at most 2 minutes of the mobile app doing prediction cameras on.
Note: Use a publicly routable URL, not localhost
You can add your files inside the path of the repo:

## Host link
 https://linear-regression-model-gzzv.onrender.com
