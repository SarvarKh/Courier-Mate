# Courier Mate
The courier registers in the system and offers his services: his own transport (bicycle, quad bike, drone, car ..), types of goods transported. The administrator confirms\rejects the Courier's Application. The client places an order for delivery and selects a Courier, rates the Couriers. The system issues an Invoice to the Client. The administrator manages users and system content.

## Live demo
[YouTube](https://youtu.be/hzVkUGBcxVY) (*note: admin feature was not recorded)


## Progress report

| Tasks                  | Start Date | End Date   |
|------------------------|------------|------------|
| Gathering requirements | 06-June-23 | 08-June-23 |
| Design Basic flow      | 09-June-23 | 10-June-23 |
| Entity Design          | 11-June-23 | 12-June-23 |
| Data Access Layer      | 13-June-23 | 14-June-23 |
| Service Layer          | 15-June-23 | 16-June-23 |
| Controller Layer       | 17-June-23 | 18-June-23 |
| Polish UI              | 19-June-23 | 20-June-23 |
| Testing                | 21-June-23 | 22-June-23 |
| Present and Finish     | 23-June-23 | 25-June-23 |

## ER Diagram

<div style="display: flex; flex-wrap: wrap">
<div align="center">
  <img src="image/erd.png?raw=true" width="90%" height="auto"/>
</div>
</div>

## Entity types

| Entity             | Type        |
|--------------------|-------------|
| Courier            | Key         |
| Client             | Key         |
| Admin              | Key         |
| Order              | Associative |
| Transport          | Key         |
| Assessment         | Associative |

## Screenshots

<div style="display: flex; flex-wrap: wrap">
<div align="center">
  <img src="image/1_order.png?raw=true" width="90%" height="auto"/>
  <img src="image/2_my_orders.png?raw=true" width="45%" height="auto"/>
  <img src="image/3_invoiced.png?raw=true" width="45%" height="auto"/>
  <img src="image/4_order_details_add_assessment.png?raw=true" width="45%" height="auto"/>
  <img src="image/5_order_details_get_assessment.png?raw=true" width="45%" height="auto"/>
  <img src="image/6_add_transport.png?raw=true" width="90%" height="auto"/>
</div>
</div>


## Getting Started
To get started with this project, follow these steps:

- Clone the repository to your local machine.
- Install in pom.xml file.
- Run the application using your IDEA's run button on Main class.
- Console window will be opened.
- you can play around with this interactive console to retrieve all inventories or by their parameters;

## Features
This project includes the following features:

- The courier registers in the system and offers his services: his own transport (bicycle, quad bike, drone, car ..), types of goods transported.
- The administrator confirms\rejects the Courier's Application. 
- The client places an order for delivery and selects a Courier, rates the Couriers. 
- The system issues an Invoice to the Client. 
- The administrator manages users and system content.

## Testing
- Administrator, Client, Courier 
- DAO, DTO, and all other layers

## Technologies Used
This project was built using the following technologies:

- Java 17.0.2 (Servlets, Filters, Listeners)
- Maven
- Dependencies (Lombok, Javax.servlet, Tomcat, postgresql, jsp-api, jstl, json, jquery)
- JavaScript, jQuery and AJAX
- Yandex Map APIs
- Postgresql and PGAdmin 4
- Bootstrap 5.3

## Authors

👤 **Sarvar Khalimov**

- GitHub: [SarvarKh](https://github.com/SarvarKh)
- Twitter: [KhalimovSarvar](https://twitter.com/KhalimovSarvar)
- LinkedIn: [Sarvar-Khalimov](https://www.linkedin.com/in/sarvar-khalimov/)


## Contributing
If you would like to contribute to this project, please follow these steps:

- Fork the repository.
- Create a new branch for your feature or bug fix.
- Make your changes and commit them.
- Push your changes to your fork.
- Submit a pull request.

## Show your support
Give a ⭐️ if you like this project!

## License
This project is [MIT](./MIT.md) licensed.
