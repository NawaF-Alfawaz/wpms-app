# wpms

In this project, we developed a database system for a package delivery company. Our product able to manage and maintain related information in a database and support 
the functionality outlined here.

Design a database system for a worldwide package delivery company (e.g., SMSA, DHL or 
FedEX). The database must be able to keep track of customers (who ship packages) and customers 
(who receive packages); some customers may do both. The detailed information of company 
employees is maintained in the database.
The company receives and ships packages and maintains up-to-date information on the processing 
and current location of each shipped package as follows:
• Shipped packages can be characterized by package number (unique), weight, dimensions, 
insurance amount, destination, and final delivery date. 
• Each package must be identifiable and trackable, so the database must be able to store the 
location of the package and its history of locations. 
• Locations include trucks, planes, airports, and warehouses and are uniquely identifiable. 
• Shipped packages are received into the system at a single retail center. Retail centers are 
characterized by their type, unique ID, and address. 
• Shipped packages make their way to their destination via one or more standard the 
company transportation events (i.e., flights, truck deliveries). These transportation events
are characterized by a unique schedule number, type (e.g, flight, truck), and the delivery
route.

The list of requirements with constraints/business rules are as follows:
a) The packages are categorized as Regular, Fragile, Liquid, Chemical etc. 
b) The status of the packages is as follows in transit, delivered, lost or damaged.
c) The value and insurance amount of the package is maintained as well as the payment to 
the company based on weight as cost for delivering the package.
d) Any company employee or customer should be able to search their packages by their ID, 
category, city and delivery date.
e) The movement history including the current place of the package in transit must be 
produced upon request. 
f) The system should be able to retrieve information of packages not delivered, damaged or 
lost.
g) The system should identify fines for delayed packages. For lost or damaged packages, the 
insurance amount is delivered to the customer instead of the package.
h) The system should be able to send notifications whenever the packages become available
for delivery as well as if they are delayed. 
i) Each package will have a unique barcode that the system will be able to read. 


![WhatsApp Image 2023-01-19 at 11 00 30 AM (1)](https://user-images.githubusercontent.com/63208501/213922832-e2bcab60-7334-4f8a-8499-0819ef14e03a.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 27 AM](https://user-images.githubusercontent.com/63208501/213922834-ce759342-b79b-410e-948c-36d077ff9afe.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 30 AM (2)](https://user-images.githubusercontent.com/63208501/213922835-a8af5de5-6e9b-4723-8cc5-cb92221b4060.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 28 AM (1)](https://user-images.githubusercontent.com/63208501/213922836-d4d70391-f8a8-44af-8f4f-e21b8c1b440c.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 28 AM (2)](https://user-images.githubusercontent.com/63208501/213922838-fe3b2981-a31c-4ee6-bc22-2a73c77978e0.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 28 AM](https://user-images.githubusercontent.com/63208501/213922840-cd4ef6a3-2bf7-4cf7-9941-2268716abcef.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 30 AM (3)](https://user-images.githubusercontent.com/63208501/213922841-46b33609-e4e8-4f2c-8b53-104d9d618cba.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 29 AM (1)](https://user-images.githubusercontent.com/63208501/213922843-b948dc45-d12c-4364-898a-d45e07e57135.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 29 AM (2)](https://user-images.githubusercontent.com/63208501/213922845-8624c2b6-fa33-471a-bc07-969191eebc6a.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 29 AM](https://user-images.githubusercontent.com/63208501/213922847-f7da3d7b-59e9-45a5-9679-70ecfcd8983a.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 30 AM](https://user-images.githubusercontent.com/63208501/213922849-8ef13437-4d90-408a-9114-228fc242255e.jpeg)
![WhatsApp Image 2023-01-19 at 11 00 31 AM](https://user-images.githubusercontent.com/63208501/213922857-5a8386f0-f9fe-4a90-bf78-a9c97135d14d.jpeg)
