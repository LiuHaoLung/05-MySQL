/*
the COMMIT statement, saves the transaction in the database, and changes cannot be undone
it can be used to save the state of the data in the database at the moment of the execution
the ROLLBACK statement, allows you to take a step back, but the last change(s) made will not count
reverts to the last non-committed state
it will refer to the state corresponding to the last time you execute COMMIT
that means if you have already used commit 10 times, rollback will have an effect on the last execution you have performed
after that moment even if you run the ROLLBACK 20 times, you can get to the state of only the last commit, you can not restore data to a state corresponding to an earlier COMMIT
*/

