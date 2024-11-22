# Football Management Application

The **Football Management Application** is designed to streamline the management of football leagues, teams, and players. It provides a user-friendly interface to organize all aspects of football operations, including league standings, team details, and player profiles.

---

## Features

- **League Management**: View and manage details of various football leagues.
- **Team Management**: Access and update information about football teams, including points and goal differences.
- **Player Management**: Maintain detailed profiles of players, including their age, position, and team affiliation.
- **Search and Navigation**: Easily search for leagues, teams, and players with advanced search options.
- **Pagination**: Efficiently navigate through large datasets with pagination support.

---

## Technologies Used

- **Ruby on Rails**: Backend framework for building the application.
- **SQLite**: Database for storing application data.
- **Bootstrap**: Frontend framework for responsive design.
- **CSV**: Import data from CSV files into the database.

---

## Installation

Follow the steps below to set up the application locally:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/football_management_app.git
   cd football_management_app
2. Install Dependencies:
bundle install

3. Set Up the Database:
bin/rails db:create
bin/rails db:migrate

4. Populate the Database: Run the seeds file to populate the database using the external API:
bin/rails db:seed

5. Start the Server:
bin/rails server

Usage
Viewing Teams

    Navigate to the Teams page to view all teams.
        Each team displays its name, points, and goal difference.
        Click the "Show" button to view detailed information about a team.

Managing Leagues

    Access the Leagues page to view and manage league details.
        Each league displays its name, type, and country.
        Search for leagues by name or type.

Player Profiles

    Visit the Players page to view detailed profiles of players.
        Each profile includes the player's name, age, position, and team affiliation.
        Search for players by name, position, or team.

Code Structure
Models

    League: Represents a football league with attributes like name, type, and country.
    Team: Represents a football team with attributes like team name, points, goal difference, and league ID.
    Player: Represents a football player with attributes like name, age, number, position, photo, and team ID.

Controllers

    TeamsController: Manages actions for viewing and updating team details.
    LeaguesController: Manages actions for viewing and updating league details.
    PlayersController: Manages actions for viewing and updating player profiles.

Views

    Teams: Contains views for displaying team information.
    Leagues: Contains views for displaying league information.
    Players: Contains views for displaying player information.

Rake Tasks

    import_books.rake: Imports data from a CSV file into the database.

Contributing

Contributions are welcome! Follow these steps to contribute to the project:

    Fork the Repository: Click the "Fork" button at the top right of the repository page.

    Clone Your Fork:

git clone https://github.com/yourusername/football_management_app.git
cd football_management_app

Create a Branch:

git checkout -b feature-name

Make Changes: Make your changes to the codebase.

Commit Changes:

git commit -m "Descriptive commit message"

Push Changes:

    git push origin feature-name

    Create a Pull Request: Open a pull request to the main repository.

Contact

For any questions or feedback, please contact: ucchwas175@gmail.com.


This README includes all necessary sections, formatted for readability and professionalism, ensuring it is informative for users and contributors.

