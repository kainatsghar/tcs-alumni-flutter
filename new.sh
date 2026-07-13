curl --location --request POST 'https://tcsalumni.linkalumniapp.com/api/get_contact_us' \
--header 'Authorization: Bearer <YOUR_TOKEN>' \
--header 'Content-Type: application/json' \
--header 'Accept: application/json' \
--data-raw '{
    "user_id": "<USER_ID>"
}'