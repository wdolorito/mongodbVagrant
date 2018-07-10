use admin
db.createUser(
  {
    user: "AdminMongo",
    pwd: "MongoAdminDevVagrant",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)
