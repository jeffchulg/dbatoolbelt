
EXEC xp_readerrorlog;

EXEC xp_readerrorlog 2;

EXEC sp_readerrorlog 0, 1, 'Login failed' 
EXEC sp_readerrorlog 0, 1, 'Login succeeded' 
