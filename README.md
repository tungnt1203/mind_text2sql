# README

# Mind Text2SQL

Mind Text2SQL is an innovative application that converts natural language queries into SQL statements, making database interactions more intuitive and accessible.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Ruby 3.2.2
- Rails 7.2.1
- Node.js 18.x or later
- PostgreSQL

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/your-username/mind_text2sql.git
   cd mind_text2sql
   ```

2. Install Ruby dependencies:
   ```
   bundle install
   ```

3. Install JavaScript dependencies:
   ```
   yarn install
   ```

4. Set up the database:
   ```
   rails db:create db:migrate
   ```

5. Start the Rails server:
   ```
   rails server
   ```

6. In a separate terminal, start the Vite development server:
   ```
   bin/vite dev
   ```

7. Visit `http://localhost:3000` in your browser to see the application running.

## Running Tests

To run the test suite:

```
rspec
```

## Deployment

Deployment instructions will be added soon.

## Built With

- [Ruby on Rails](https://rubyonrails.org/) - The web framework used
- [Vite](https://vitejs.dev/) - Frontend build tool
- [PostgreSQL](https://www.postgresql.org/) - Database
