#?/usr/bin/bash
#export PGPASSWORD="postgres"
PSQL="psql --username=chakroun --dbname=worldcup    -t --no-align -c"
echo $($PSQL"truncate games , teams")
	cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do

if [[ $YEAR != "year" ]]
  then 
	WINNER1_ID=$($PSQL"select team_id from teams where name='$WINNER'")

	if [[ -z $WINNER1_ID ]]
	   then
		INSERT_NAME1=$($PSQL"insert into teams (name) values('$WINNER')")			
		if [[ $INSERT_NAME1 == "INSERT 0 1" ]]
			then
			   echo Inserted team $WINNER
		fi
	fi
	OPPONENT1_ID=$($PSQL"select team_id from teams where name='$OPPONENT'")

        if [[ -z $OPPONENT1_ID ]]
           then
                INSERT_NAME2=$($PSQL"insert into teams (name) values('$OPPONENT')") 
                if [[ $INSERT_NAME2 == "INSERT 0 1" ]]
                        then
                           echo Inserted team $OPPONENT
                fi
        fi
		
fi
	
   if [[ $YEAR != "year" ]]
	
	then
		WINNER_ID=$($PSQL"select team_id from teams where name='$WINNER'")
		OPPONENT_ID=$($PSQL"select team_id from teams where name ='$OPPONENT'")

	INSERT_GAME=$($PSQL"insert into games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) values ($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")

  if [[ INSERT_GAME == "INSERT 0 1" ]]
	then
		echo New game added: $YEAR,$ROUND,$WINNER_ID,$OPPONENT_ID, THE SCORE $WINNER_GOALS : $OPPONENT_GOALS

	fi
fi


done
