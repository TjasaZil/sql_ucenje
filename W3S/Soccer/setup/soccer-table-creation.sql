-- https://www.w3resource.com/sql-exercises/soccer-database-exercise/index.php

-- Kreiranje sheme
CREATE SCHEMA IF NOT EXISTS soccer;

-- Uporaba sheme
USE soccer;

-- Table: soccer_country
CREATE TABLE soccer_country (
    country_id INTEGER PRIMARY KEY,
    country_abbr VARCHAR(10),
    country_name VARCHAR(50)
);

-- Table: soccer_city
CREATE TABLE soccer_city (
    city_id INTEGER PRIMARY KEY,
    city VARCHAR(50),
    country_id INTEGER,
    CONSTRAINT fk_soccer_city_country
      FOREIGN KEY (country_id) REFERENCES soccer_country(country_id)
);

-- Table: soccer_venue
CREATE TABLE soccer_venue (
    venue_id INTEGER PRIMARY KEY,
    venue_name VARCHAR(100),
    city_id INTEGER,
    aud_capicity INTEGER,
    CONSTRAINT fk_soccer_venue_city
      FOREIGN KEY (city_id) REFERENCES soccer_city(city_id)
);

-- Table: soccer_team
CREATE TABLE soccer_team (
    team_id INTEGER PRIMARY KEY,
    country_id INTEGER,   -- the country that the team represents
    team_group VARCHAR(10),
    match_played INTEGER,
    won INTEGER,
    draw INTEGER,
    lost INTEGER,
    goal_for INTEGER,     -- (as described, “goals conceded”; adjust if needed)
    goal_agnst INTEGER,   -- (as described, “goals scored”; adjust if needed)
    goal_diff INTEGER,
    points INTEGER,
    group_position INTEGER,
    CONSTRAINT fk_soccer_team_country
      FOREIGN KEY (country_id) REFERENCES soccer_country(country_id)
);

-- Table: playing_position
CREATE TABLE playing_position (
    position_id INTEGER PRIMARY KEY,
    position_desc VARCHAR(50)
);

-- Table: coach_mast
CREATE TABLE coach_mast (
    coach_id INTEGER PRIMARY KEY,
    coach_name VARCHAR(100)
);

-- Table: asst_referee_mast
CREATE TABLE asst_referee_mast (
    ass_ref_id INTEGER PRIMARY KEY,
    ass_ref_name VARCHAR(100),
    country_id INTEGER,
    CONSTRAINT fk_asst_ref_country
      FOREIGN KEY (country_id) REFERENCES soccer_country(country_id)
);

-- Table: referee_mast
CREATE TABLE referee_mast (
    referee_id INTEGER PRIMARY KEY,
    referee_name VARCHAR(100),
    country_id INTEGER,
    CONSTRAINT fk_referee_country
      FOREIGN KEY (country_id) REFERENCES soccer_country(country_id)
);

-- Table: player_mast
CREATE TABLE player_mast (
    player_id INTEGER PRIMARY KEY,
    team_id INTEGER,
    jersey_no INTEGER,
    player_name VARCHAR(100),
    posi_to_play INTEGER,
    dt_of_bir DATE,
    age INTEGER,
    playing_club VARCHAR(100),
    CONSTRAINT fk_player_team
      FOREIGN KEY (team_id) REFERENCES soccer_team(team_id),
    CONSTRAINT fk_player_position
      FOREIGN KEY (posi_to_play) REFERENCES playing_position(position_id)
);

-- Table: match_mast
CREATE TABLE match_mast (
    match_no INTEGER PRIMARY KEY,
    play_stage CHAR(1),         -- e.g., G, R, Q, S, F
    play_date DATE,
    results VARCHAR(10),        -- e.g., 'win' or 'draw'
    decided_by CHAR(1),         -- N (normal) or P (penalty shootout)
    goal_score VARCHAR(10),     -- can hold the score (e.g., '2-1') or a numeric value if desired
    venue_id INTEGER,
    referee_id INTEGER,
    audence INTEGER,
    plr_of_match INTEGER,       -- player awarded as man of the match
    stop1_sec INTEGER,          -- stoppage time (seconds) for the 1st half
    stop2_sec INTEGER,          -- stoppage time (seconds) for the 2nd half
    CONSTRAINT fk_match_venue
      FOREIGN KEY (venue_id) REFERENCES soccer_venue(venue_id),
    CONSTRAINT fk_match_referee
      FOREIGN KEY (referee_id) REFERENCES referee_mast(referee_id),
    CONSTRAINT fk_match_player
      FOREIGN KEY (plr_of_match) REFERENCES player_mast(player_id)
);

-- Table: match_details
CREATE TABLE match_details (
    match_no INTEGER,
    play_stage CHAR(1),
    team_id INTEGER,
    win_lose CHAR(1),         -- 'W', 'L', or 'D'
    decided_by CHAR(1),       -- N for normal score or P for penalty shootout
    goal_score INTEGER,
    penalty_score INTEGER,
    ass_ref INTEGER,          -- assistant referee ID
    player_gk INTEGER,        -- goalkeeper (player_id)
    PRIMARY KEY (match_no, team_id),
    CONSTRAINT fk_details_match
      FOREIGN KEY (match_no) REFERENCES match_mast(match_no),
    CONSTRAINT fk_details_team
      FOREIGN KEY (team_id) REFERENCES soccer_team(team_id),
    CONSTRAINT fk_details_ass_ref
      FOREIGN KEY (ass_ref) REFERENCES asst_referee_mast(ass_ref_id),
    CONSTRAINT fk_details_gk
      FOREIGN KEY (player_gk) REFERENCES player_mast(player_id)
);

-- Table: goal_details
CREATE TABLE goal_details (
    goal_id INTEGER PRIMARY KEY,
    match_no INTEGER,
    player_id INTEGER,
    team_id INTEGER,
    goal_time TIME,           -- time when the goal was scored
    goal_type CHAR(1),        -- N: normal, O: own goal, P: penalty
    play_stage CHAR(1),       -- G, R, Q, S, or F
    goal_schedule VARCHAR(2), -- NT: normal time, ST: stoppage time, ET: extra time
    goal_half INTEGER,        -- e.g., 1 for first half, 2 for second half
    CONSTRAINT fk_goal_match
      FOREIGN KEY (match_no) REFERENCES match_mast(match_no),
    CONSTRAINT fk_goal_player
      FOREIGN KEY (player_id) REFERENCES player_mast(player_id),
    CONSTRAINT fk_goal_team
      FOREIGN KEY (team_id) REFERENCES soccer_team(team_id)
);

-- Table: penalty_shootout
CREATE TABLE penalty_shootout (
    kick_id INTEGER PRIMARY KEY,
    match_no INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    score_goal CHAR(1),       -- Y if the goal is scored, N if not
    kick_no INTEGER,
    CONSTRAINT fk_penalty_match
      FOREIGN KEY (match_no) REFERENCES match_mast(match_no),
    CONSTRAINT fk_penalty_team
      FOREIGN KEY (team_id) REFERENCES soccer_team(team_id),
    CONSTRAINT fk_penalty_player
      FOREIGN KEY (player_id) REFERENCES player_mast(player_id)
);

-- Table: player_booked
CREATE TABLE player_booked (
    match_no INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    booking_time TIME,
    sent_off CHAR(1),         -- Y if sent off, otherwise can be left null or N
    play_schedule VARCHAR(2), -- NT, ST, or ET
    play_half INTEGER,
    PRIMARY KEY (match_no, team_id, player_id, booking_time),
    CONSTRAINT fk_booked_match
      FOREIGN KEY (match_no) REFERENCES match_mast(match_no),
    CONSTRAINT fk_booked_team
      FOREIGN KEY (team_id) REFERENCES soccer_team(team_id),
    CONSTRAINT fk_booked_player
      FOREIGN KEY (player_id) REFERENCES player_mast(player_id)
);

-- Table: player_in_out
CREATE TABLE player_in_out (
    match_no INTEGER,
    team_id INTEGER,
    player_id INTEGER,
    in_out CHAR(1),           -- I for in, O for out
    time_in_out TIME,
    play_schedule VARCHAR(2), -- NT, ST, or ET
    play_half INTEGER,
    PRIMARY KEY (match_no, team_id, player_id, time_in_out),
    CONSTRAINT fk_in_out_match
      FOREIGN KEY (match_no) REFERENCES match_mast(match_no),
    CONSTRAINT fk_in_out_team
      FOREIGN KEY (team_id) REFERENCES soccer_team(team_id),
    CONSTRAINT fk_in_out_player
      FOREIGN KEY (player_id) REFERENCES player_mast(player_id)
);

-- Table: match_captain
CREATE TABLE match_captain (
    match_no INTEGER,
    team_id INTEGER,
    player_captain INTEGER,
    PRIMARY KEY (match_no, team_id),
    CONSTRAINT fk_captain_match
      FOREIGN KEY (match_no) REFERENCES match_mast(match_no),
    CONSTRAINT fk_captain_team
      FOREIGN KEY (team_id) REFERENCES soccer_team(team_id),
    CONSTRAINT fk_captain_player
      FOREIGN KEY (player_captain) REFERENCES player_mast(player_id)
);

-- Table: team_coaches
CREATE TABLE team_coaches (
    team_id INTEGER,
    coach_id INTEGER,
    PRIMARY KEY (team_id, coach_id),
    CONSTRAINT fk_team_coach_team
      FOREIGN KEY (team_id) REFERENCES soccer_team(team_id),
    CONSTRAINT fk_team_coach_coach
      FOREIGN KEY (coach_id) REFERENCES coach_mast(coach_id)
);

-- Table: penalty_gk
CREATE TABLE penalty_gk (
    match_no INTEGER,
    team_id INTEGER,
    player_gk INTEGER,
    PRIMARY KEY (match_no, team_id),
    CONSTRAINT fk_penalty_gk_match
      FOREIGN KEY (match_no) REFERENCES match_mast(match_no),
    CONSTRAINT fk_penalty_gk_team
      FOREIGN KEY (team_id) REFERENCES soccer_team(team_id),
    CONSTRAINT fk_penalty_gk_player
      FOREIGN KEY (player_gk) REFERENCES player_mast(player_id)
);
