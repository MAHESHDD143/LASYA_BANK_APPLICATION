# 🏦 Lasya Bank Application

A web-based banking application built with **Spring Boot**, **Spring MVC**, **Spring Data JPA** and **MySQL**, with **JSP** views. It lets a customer open an account, check the balance, deposit, withdraw and transfer money, following a clean **MVC (Controller → Service → Repository)** structure.

![Java](https://img.shields.io/badge/Java-17-ED8B00?style=flat-square&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.2.1-6DB33F?style=flat-square&logo=springboot&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-C71A36?style=flat-square&logo=apachemaven&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-JSTL-007396?style=flat-square)

---

## ✨ Features

| Feature | Description |
|---|---|
| **Open account** | Register with account number, name, password, opening amount, address and mobile number |
| **Account authentication** | Every operation is verified with account number + name + password |
| **Balance enquiry** | View account details after validating credentials |
| **Deposit** | Add money to your account and see the previous and updated balance |
| **Withdraw** | Withdraw money with a balance check |
| **Fund transfer** | Transfer money to another account, with a check that the target account exists |
| **Close account** | Separate close-account form and confirmation page |
| **Error pages** | Friendly pages for invalid account details and failed transfers |

---

## 🧰 Tech Stack

- **Language:** Java 17
- **Framework:** Spring Boot 3.2.1 (Spring Web MVC, Spring Data JPA / Hibernate)
- **View layer:** JSP + JSTL (Tomcat Jasper)
- **Database:** MySQL
- **Build tool:** Maven (Maven Wrapper included)
- **Other:** Spring Boot DevTools

---

## 🏗️ Architecture

```
Browser (JSP views)
      │
      ▼
BankController          →  handles requests, prepares the model, picks the view
      │
      ▼
BankAccountService      →  business logic (deposit, withdraw, transfer)
(BankAccountServiceImp)
      │
      ▼
BankAccountRepository   →  Spring Data JPA queries
      │
      ▼
MySQL  (table: bank)
```

### Project structure

```
src/main
├── java/com/web
│   ├── Application.java
│   ├── controller/BankController.java
│   ├── entity/BankAccount.java
│   ├── repo/BankAccountRepository.java
│   └── service/
│       ├── BankAccountService.java
│       └── BankAccountServiceImp.java
├── resources/application.properties
└── webapp/views/        # JSP pages (home, forms, success/error and result pages)
```

---

## 🗄️ Data Model

Entity `BankAccount`, mapped to table `bank`:

| Column | Type | Notes |
|---|---|---|
| `accountNumber` | Long | Primary key |
| `name` | String | Account holder name |
| `password` | String | Used to authenticate operations |
| `amount` | double | Current balance |
| `address` | String | |
| `mobileNumber` | String | |
| `targetAccountNumber` | Long | Used for transfers |

The table is created automatically on startup (`spring.jpa.hibernate.ddl-auto=update`).

---

## 🔗 Application Routes

| Route | Purpose |
|---|---|
| `/` | Home page |
| `/addAccount` → `/registerAccount` | Open account form and submit |
| `/checkBalance` → `/validateAccount` | Balance enquiry form and result |
| `/depositAmount` → `/depositBalance` | Deposit form and result |
| `/withdrawBalance` → `withdrawAmount` | Withdraw form and result |
| `/transferBalance` → `/transferFunds` | Transfer form and result |
| `/close` → `/closeAccount` | Close account form and confirmation |

---

## 🚀 Getting Started

### Prerequisites
- JDK 17
- MySQL running locally
- Maven (or use the included `mvnw`)

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/MAHESHDD143/LASYA_BANK_APPLICATION.git
   cd LASYA_BANK_APPLICATION
   ```

2. **Create the database**
   ```sql
   CREATE DATABASE bankapl;
   ```

3. **Configure `src/main/resources/application.properties`**
   ```properties
   server.port=8070
   spring.datasource.url=jdbc:mysql://localhost:3306/bankapl?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true
   spring.datasource.username=<your-mysql-username>
   spring.datasource.password=<your-mysql-password>
   ```

4. **Run the application**
   ```bash
   ./mvnw spring-boot:run
   ```
   You can also run `Application.java` directly from your IDE (Eclipse / STS / IntelliJ).

5. **Open in the browser**
   ```
   http://localhost:8070
   ```

---

## 🧭 How to Use

1. Click **NEW ACCOUNT** and fill in your details.
2. Use **BALANCE**, **DEPOSIT**, **WITHDRAW** or **TRANSFER** from the home menu and enter your account number, name and password.
3. For a transfer, also enter the target account number. If the target account does not exist, an error page is shown.

---

## 🔮 Possible Improvements

- Hash passwords with BCrypt (Spring Security) instead of storing plain text
- Submit forms with `POST` instead of `GET`
- Role-based access (customer / administrator) with login sessions
- Make transfers atomic with `@Transactional` and add transaction history
- Input validation and global exception handling
- Unit and integration tests for the service layer
- REST API layer and a modern frontend

---

## 👨‍💻 Author

**D Mahesh**, Java Backend Developer
📧 dongamahesh159@gmail.com · [GitHub](https://github.com/MAHESHDD143) · [LinkedIn](https://www.linkedin.com/in/mahesh-donga-a320b6256)
