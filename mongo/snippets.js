/** @format */

db.createUser({
  user: 'user',
  pwd: 'password',
  roles: [{ role: 'dbOwner', db: 'dbname' }],
})
