# Boboho

### Build a Rails app based on:
* A Second-Hand Buy and Sell App (Carousell)

The app has 6 features:

1. A user authentication feature built from scratch (sign up/sign in). Not using clearance/devise gem. Using gem bcrypt.
2. A user authentication feature using OAuth. Using Omniauth and Omniauth-Facebook gems.
3. Users should have a concept of roles (normal, admin and superadmin).
4. A search functionality ( using pgsearch, search for item using title and description keyword)
5. Integrate Twilio API provider (programmable chat).
6. AJAX functionality; user can like listings


### Write some tests
1. Wrote some model validation test.
2. Wrote 2 model specs, testing any custom model methods (test for happy and edgy paths).
3. Wrote 1 integration spec using Capybara's library to simulate user logging in.

### Deploy app to Heroku
boboho.herokuapp.com
