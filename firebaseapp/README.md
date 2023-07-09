Password Manager App
1. Create Login Screen
   - Either login or create account
   - Store username and password in Firebase authentication
   - Every user has their own sets of data
2. Display Passwords
   - Display them in a long list of boxes
   - Boxes will contain website, username, password
   - Passwords will appear encrypted in the list
3. Add Username/Password
   - Circle Plus button at bottom
   - Use master key to generate hash/salt/bcrypt
   - send site,username,password to database
4. Copy/Delete Password
   - Click on boxes to reveal two options: copy password or delete password from database