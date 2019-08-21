## OWASP Top 10

https://www.owasp.org/index.php/Category:OWASP_Top_Ten_2017_Project

### #1 - The big one: Injection

- If you let user input directly go into your SQL, this can be a real problem

```js
models.sequelize.query('SELECT * FROM Users WHERE email = \'' + (req.body.email || '') + '\' AND password = \'' + insecurity.hash(req.body.password || '') + '\' AND deletedAt IS NULL')
```

- What if I put in my email as `' OR email LIKE 'admin%';`?
- We have a great tool to help prevent this: ORMs. If you are using one properly, it almost certainly prevents SQL injection.
- But you can use it improperly: 
  
  `Query HQLQuery = session.createQuery("FROM accounts WHERE custID='" + request.getParameter("id") + "'");`

- Implement SQL strings using prepared statements that bind variables. (https://docs.jboss.org/hibernate/orm/5.4/userguide/html_single/Hibernate_User_Guide.html#sql-query-parameters)

```js
models.sequelize.query('SELECT * FROM Users WHERE email = :email AND password = :password AND deletedAt IS NULL', {
  replacements: {
    email: req.body.email || '',
    password: insecurity.hash(req.body.password || '')
  },
  type: models.sequelize.QueryTypes.SELECT
})
```

- Injection isn't just about SQL. It can be used anywhere you're using unsanitized user input: OS commands, NoSQL databases, etc

### #2 - Poor authentication

- Usernames and passwords are insecure by default
- Attackers use lists of common usernames and passwords, or known usernames and passwords from other sites
- Big mistakes
  - Not hashing passwords. Encryption isn't good enough.
  - Not salting passwords -- rainbow tables make hashing ineffective alone
  - Using the same salt multiple times
  - Allowing well-known or weak passwords. Making your rules too onerous doesn't work, but don't allow for truly bad passwords.
  - Allowing password recovery through questions
  - Putting session IDs in the URL
- Good ideas
  - Two-factor authentication
  - Expiring session cookies on browser exit
- [How to store passwords correctly](https://crackstation.net/hashing-security.htm) 

### #3 - Exposing sensitive data

- Discard all sensitive data you can
- Protect all sensitive data you must keep
- Require SSL (it's free now)

### #4 - Allowing arbitrary XML to be accepted

https://www.owasp.org/index.php/Top_10-2017_A4-XML_External_Entities_(XXE)

### #5 - Broken access control

https://www.owasp.org/index.php/Top_10-2017_A5-Broken_Access_Control

- The biggest problem I see here is with URLs
  - Using PKs directly in the URL exposes information to users
  - They can change the PK to see what happens
  - Consider using a UUID or other method
  - But also create solid access control

### #6 - Security misconfiguration

https://www.owasp.org/index.php/Top_10-2017_A6-Security_Misconfiguration

### #7 - Cross-site scripting -- the other big one

- This occurs when users can inject arbitrary HTML into your page
- _Always_ escape or sanitize user input
- If sanitizing, use a whitelist, not a blacklist
- Set a [Content Security Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
- Protip: most modern web frameworks escape by default, but you should make sure and read their documentation to make sure you know when they do and do not do this (see line 5 of search-result.component.html)

https://www.owasp.org/index.php/Top_10-2017_A7-Cross-Site_Scripting_(XSS)

### #8 - Insecure deserialization

- To serialize and deserialize data, stick to JSON, XML, or another simple data format
- Do not use serialized data to determine class names or method calls

### #9 - Using insecure libraries

https://www.owasp.org/index.php/Top_10-2017_A9-Using_Components_with_Known_Vulnerabilities

- Keep libraries up to date!
- Automatically scan for known vulnerabilities with [Dependency Check](https://jeremylong.github.io/DependencyCheck/)

### #10 - Insufficient Logging

https://www.owasp.org/index.php/Top_10-2017_A10-Insufficient_Logging%26Monitoring
