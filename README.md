# Rails API with JWT Authentication

A Ruby on Rails 8.0.2 API application implementing JWT (JSON Web Token) authentication using Devise and devise-jwt gems.

## Features

- JWT-based authentication
- User registration and login
- Secure password handling with Devise
- JSON API endpoints
- CORS support
- RuboCop for code style enforcement
- Brakeman for security analysis
- GitHub Actions CI pipeline

## Technology Stack

- Ruby 3.3.6
- Rails 8.0.2
- SQLite3 2.1+ (Database)
- Devise & devise-jwt (Authentication)
- rack-cors (CORS support)
- RuboCop (Code style)
- Brakeman (Security analysis)

## Prerequisites

Before you begin, ensure you have the following installed:
- Ruby 3.3.6
- Bundler
- SQLite3 2.1+

## Setup

1. Clone the repository:
   `ash
   git clone https://github.com/marmolleonardo/rails-api-devise-jwt.git
   cd rails-api-devise-jwt
   `

2. Install dependencies:
   `ash
   bundle install
   `

3. Setup database:
   `ash
   rails db:create
   rails db:migrate
   `

4. Start the server:
   `ash
   rails s
   `

The API will be available at http://localhost:4000

## API Endpoints

### Authentication

All authentication endpoints return JWT tokens in the response headers.

#### Registration
`
POST /signup
Content-Type: application/json

{
  \
user\: {
    \email\: \user@example.com\,
    \password\: \password\
  }
}
`

#### Login
`
POST /login
Content-Type: application/json

{
  \user\: {
    \email\: \user@example.com\,
    \password\: \password\
  }
}
`

#### Logout
`
DELETE /logout
Authorization: Bearer <jwt_token>
`

#### Get Current User
`
GET /current_user
Authorization: Bearer <jwt_token>
`

## Development

### Code Style

The project uses RuboCop with Rails' official style guide (rubocop-rails-omakase) plus additional extensions for RSpec and Performance. To run the style checks:

`ash
bin/rubocop
`

To auto-correct issues:
`ash
bin/rubocop -A
`

### Security Analysis

To run security checks with Brakeman:

`ash
bin/brakeman
`

## CI/CD

The project includes GitHub Actions workflows for:
- Security scanning (Brakeman)
- JavaScript dependency auditing
- Code style checking (RuboCop)

Check .github/workflows/ci.yml for the complete CI configuration.

## Contributing

1. Fork the repository
2. Create your feature branch: git checkout -b feature/my-new-feature
3. Commit your changes: git commit -am 'Add some feature'
4. Push to the branch: git push origin feature/my-new-feature
5. Submit a pull request

## License

This project is licensed under the MIT License.
