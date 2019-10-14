password = "123123"
admin = User.create(username: "Admin" , email: "admin@gmail.com" , password: password , password_confirmation: password, role: 2)
leader = User.create(username: "Leader" , email: "leader@gmail.com" , password: password , password_confirmation: password, role: 2)
user = User.create(username: "User" , email: "user@gmail.com" , password: password , password_confirmation: password)
user1 = User.create(username: "User1" , email: "user1@gmail.com" , password: password , password_confirmation: password)
user2 = User.create(username: "User2" , email: "user2@gmail.com" , password: password , password_confirmation: password)
user3 = User.create(username: "User" , email: "user3@gmail.com" , password: password , password_confirmation: password)
