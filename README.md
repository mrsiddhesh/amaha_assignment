## Customers Invite API

This Ruby on Rails API allows uploading a customers.txt file (JSON lines
format) and returns a list of customers who are within 100km of the
Mumbai office (latitude: 19.0590317, longitude: 72.7553452).

The API calculates the distance using the Haversine formula and returns
customers sorted by user_id.

### Set up Instructions

1.  Clone the Repository

2.  Install dependencies using \"bundle install\"

3.  Install RSpec if not installed using \"rails generate rspec:
    install\"

4.  For Running Tests, use - "bundle exec rspec"

### Install Dependencies

1.  Make sure you have **Ruby 3.x** and **Rails 7.x** installed. You can
   check your Ruby version by running.

2.  Then, install the required dependencies using Bundler: **bundle
    install**

3.  Start the Rails development server: **rails server**

4.  To ensure everything is working as expected, you can run the test
    suite using RSpec: **bundle exec rspec**

### API Documentation

#### Upload Customers File and Get Invited Customers

1.  **Endpoint:** POST /api/v1/customers/invite

2.  **Request Type:** multipart/form-data

3.  **Request Parameter**: file --- A .txt file containing customer
    records in JSON lines format.

#### using cURL

To upload the file via cURL, use the following command:

> curl -X POST http://localhost:3000/api/v1/customers/invite \\

> -F \"file=@path/to/customers.txt\"

#### Successful Response (200 OK)

If the customers are within the 100km range, you will receive a JSON
response with their user_id and name, sorted by user_id:

>\[

>{

>\"user_id\": 1,

>\"name\": \"Christina McArdle\"

>},

>{

>\"user_id\": 2,

>\"name\": \"Alice Cahill\"

>},

>\...

>\]

#### Error Responses

1 - **Invalid File Type (Not a .txt file):**

> {
>
> \"error\": \"Invalid file format. Please upload a .txt file.\"
>
> }

2- **Invalid JSON format in the file:**

> {
>
> \"error\": \"Invalid JSON format in file.\"
>
> }
