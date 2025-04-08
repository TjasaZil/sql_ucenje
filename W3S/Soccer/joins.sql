-- https://www.w3resource.com/sql-exercises/soccer-database-exercise/joins-exercises-on-soccer-database.php

-- 1. From the following table, write a SQL query to find out where the final match of the EURO cup 2016 was played. Return venue name, city.

-- 2. From the following tables, write a SQL query to find the number of goals scored by each team in each match during normal play. Return match number, country name and goal score.

-- 3. From the following table, write a SQL query to count the number of goals scored by each player within a normal play schedule. Group the result set on player name and country name and sorts the result-set according to the highest to the lowest scorer. Return player name, number of goals and country name.

-- 4. From the following table, write a SQL query to find out who scored the most goals in the 2016 Euro Cup. Return player name, country name and highest individual scorer.

-- 5. From the following table, write a SQL query to find out who scored in the final of the 2016 Euro Cup. Return player name, jersey number and country name.

-- 6. From the following tables, write a SQL query to find out which country hosted the 2016 Football EURO Cup. Return country name.

-- 7. From the following tables, write a SQL query to find out who scored the first goal of the 2016 European Championship. Return player_name, jersey_no, country_name, goal_time, play_stage, goal_schedule, goal_half.

-- 8. From the following tables, write a SQL query to find the referee who managed the opening match. Return referee name, country name.

-- 9. From the following tables, write a SQL query to find the referee who managed the final match. Return referee name, country name.

-- 10. From the following tables, write a SQL query to find the referee who assisted the referee in the opening match. Return associated referee name, country name.

-- 11. From the following tables, write a SQL query to find the referee who assisted the referee in the final match. Return associated referee name, country name.

-- 12. From the following table, write a SQL query to find the city where the opening match of EURO cup 2016 took place. Return venue name, city.

-- 13. From the following tables, write a SQL query to find out which stadium hosted the final match of the 2016 Euro Cup. Return venue_name, city, aud_capacity, audience.

-- 14. From the following tables, write a SQL query to count the number of matches played at each venue. Sort the result-set on venue name. Return Venue name, city, and number of matches.

-- 15. From the following tables, write a SQL query to find the player who was the first player to be sent off at the tournament EURO cup 2016. Return match Number, country name and player name.

-- 16. From the following tables, write a SQL query to find the teams that have scored one goal in the tournament. Return country_name as "Team", team in the group, goal_for.

-- 17. From the following tables, write a SQL query to count the number of yellow cards each country has received. Return country name and number of yellow cards.

-- 18. From the following tables, write a SQL query to count the number of goals that have been seen. Return venue name and number of goals.

-- 19. From the following tables, write a SQL query to find the match where there was no stoppage time in the first half. Return match number, country name.

-- 20. From the following tables, write a SQL query to find the team(s) who conceded the most goals in EURO cup 2016. Return country name, team group and match played.

-- 21. From the following tables, write a SQL query to find those matches where the highest stoppage time was added in 2nd half of play. Return match number, country name, stoppage time(sec.).

-- 22. From the following tables, write a SQL query to find the matches that ended in a goalless draw at the group stage. Return match number, country name.

-- 23. From the following tables, write a SQL query to find those match(s) where the second highest amount of stoppage time was added in the second half of the match. Return match number, country name and stoppage time.

-- 24. From the following tables, write a SQL query to find the number of matches played by a player as a goalkeeper for his team. Return country name, player name, number of matches played as a goalkeeper.

-- 25. From the following tables, write a SQL query to find the venue where the most goals have been scored. Return venue name, number of goals

-- 26. From the following tables, write a SQL query to find the oldest player to have appeared in a EURO 2016 match. Return country name, player name, jersey number and age.

-- 27. From the following tables, write a SQL query to find the two teams in this tournament that have scored three goals in a single game. Return match number and country name.

-- 28. From the following tables, write a SQL query to find which teams finished at the bottom of their respective groups after conceding four goals in three games. Return country name, team group and match played.

-- 29. From the following tables, write a SQL query to find those players, who were contracted to the Lyon club and participated in the final of the EURO cup 2016. Return player name, jerseyno, position to play, age, and country name.

-- 30. From the following tables, write a SQL query to find the final four teams in the tournament. Return country name.

-- 31. From the following tables, write a SQL query to find the captains of the top four teams that competed in the semi-finals (matches 48 and 49) of the tournament. Return country name, player name, jersey number and position to play.

-- 32. From the following tables, write a SQL query to find the captains of all the matches in the tournament. Return match number, country name, player name, jersey number and position to play.

-- 33. From the following tables, write a SQL query to find the captain and goalkeeper of all the matches. Return match number, Captain, Goal Keeper and country name.

-- 34. From the following table, write a SQL query to find out the player who was selected for the ‘Man of the Match’ award in the finals of EURO cup 2016. Return player name, country name.

-- 35. From the following tables, write a SQL query to find the substitute players who entered the field during the first half of play within the normal time frame for the game. Return match_no, country_name, player_name, jersey_no and time_in_out.

-- 36. From the following table, write a SQL query to prepare a list for the “player of the match” against each match. Return match number, play date, country name, player of the Match, jersey number.

-- 37. From the following tables, write a SQL query to find the player who took the penalty shot number 26. Return match number, country name, player name.

-- 38. From the following tables, write a SQL query to find the team against which the penalty shot number 26 was taken. Return match number, country name.

-- 39. From the following tables, write a SQL query to find the captain who was also the goalkeeper. Return match number, country name, player name and jersey number.

-- 40. From the following tables, write a SQL query to find the number of captains who was also the goalkeeper. Return number of captains.

-- 41. From the following tables, write a SQL query to find out how many times a player had been booked in the tournament. Show the result according to the team and number of times booked in descending order. Return country name, player name, and booked number of times.

-- 42. From the following tables, write a SQL query to count the players who booked the most number of times. Return player name, number of players who booked most number of times.

-- 43. From the following tables, write a SQL query to find out how many players each team has booked. Return country name, number of players booked.

-- 44. From the following tables, write a SQL query to find the matches in which the most cards are displayed. Return match number, number of cards shown.

-- 45. From the following table, write a SQL query to find the assistant referees. Return match number, country name, assistant referee name.

-- 46. From the following table, write a SQL query to find the assistant referees of each country assist the number of matches. Sort the result-set in descending order on number of matches. Return country name, number of matches.

-- 47. From the following table, write a SQL query to find the countries from where the assistant referees assist most of the matches. Return country name and number of matches.

-- 48. From the following table, write a SQL query to find the name of referees for each match. Sort the result-set on match number. Return match number, country name, referee name.

-- 49. From the following tables, write a SQL query to count the number of matches managed by referees of each country. Return country name, number of matches.

-- 50. From the following tables, write a SQL query to find the countries from where the referees managed most of the matches. Return country name, number of matches.

-- 51. From the following tables, write a SQL query to find the number of matches managed by each referee. Return referee name, country name, number of matches.

-- 52. From the following tables, write a SQL query to find those referees who managed most of the matches. Return referee name, country name and number of matches.

-- 53. From the following tables, write a SQL query to find those referees who managed the number of matches at each venue. Return referee name, country name, venue name, number of matches.

-- 54. From the following tables, write a SQL query to find the referees and the number of bookings they made. Return referee name, number of matches.

-- 55. From the following tables, write a SQL query to find those referees who booked the most number of players. Return referee name, number of matches.

-- 56. From the following tables, write a SQL query to find those players on each team who wore jersey number 10. Return country name, player name, position to play, age and playing club.

-- 57. From the following tables, write a SQL query to find the defenders who scored goals for their team. Return player name, jersey number, country name, age and playing club.

-- 58. From the following table, write a SQL query to find out which players scored against his own team by accident. Return player name, jersey number, country name, age, position to play, and playing club

-- 59. From the following table, write a SQL query to find the results of penalty shootout matches. Return match number, play stage, country name and penalty score.

-- 60. From the following table, write a SQL query to find the goal scored by each player according to their position. Return country name, position to play, and number of goals.

-- 61. From the following tables, write a SQL query to find those players who came into the field at the end of play. Return match number, country name, player name, jersey number and time in out.