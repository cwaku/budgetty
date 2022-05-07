# Budgetty

> A mobile web application where you can manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what.
## Project requirements

## Built With

- css framework: Tailwind rails

- Major languages: Rails, Ruby

- Technologies used: [Rubocop](https://rubocop.org/)


### Prerequisites

- [Ruby](https://www.ruby-lang.org/)
- [Rails](https://guides.rubyonrails.org/getting_started.html)
- [Tailwindcss](https://tailwindcss.com/docs/installation).

### Setup
- Install gems with:
- ` bundle install`
- ` NPM install`
- Setup database with
- `rails db:create`
- `rails db:migrate`

### Usage

Note: Confirm that you can run `Procfile.dev` to use `./bin/dev`. Else if you can't run it, run `./bin/rails server` but that also won't build the Tailwindcss.

- run: ` git clone https://github.com/cwaku/budgetty.git `
- connect to postgresql with: ` psql -U postgres `
- run: ` ./bin/dev ` to connect to the server
- Open http://localhost:3000/ in your browser.

### Run tests
- install npm with:
- `npm i`
- install rspec with:
- `bundle install`
- and
- ` rails generate rspec:install`
- Run the test with:
- `rspec spec`
## Author

👤 **Ricky Mormor**

- GitHub: [@cwaku](https://github.com/cwaku)
- Twitter: [@rickymormor](https://twitter.com/rickymormor)
- LinkedIn: [Ricky Mormor](https://github.com/cwaku/blog/blob/develop/www.linkedin.com/in/rickymormor)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/cwaku/budgetty/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

N/A

## 📝 License

This project is [MIT](./license.md) licensed.
