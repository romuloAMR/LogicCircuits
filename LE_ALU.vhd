LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY LE_ALU IS
    PORT(
		A  : IN  STD_LOGIC;
      B  : IN  STD_LOGIC;
      M  : IN  STD_LOGIC;
      S0 : IN  STD_LOGIC;
      S1 : IN  STD_LOGIC;
      O  : OUT STD_LOGIC
    );
END LE_ALU;

ARCHITECTURE Behavior OF LE_ALU IS
SIGNAL Sig1, Sig2, Sig3, Sig4, Sig5, Sig6, Sig7, Sig8 : STD_LOGIC;
BEGIN
	Sig1 <= (A) AND (NOT M);
    Sig2 <= (A) AND (NOT B) AND (NOT S0) AND (S1);
	Sig3 <= (NOT A) AND (B) AND (M) AND (NOT S0) AND (S1);
	Sig4 <= (NOT A) AND (NOT B) AND (M) AND (S0) AND (S1);
	Sig5 <= (A) AND (B) AND (M) AND (S0);
	Sig6 <= (A) AND (B) AND (M) AND (NOT S1);
	Sig7 <= (B) AND (M) AND (S0) AND (NOT S1);
	Sig8 <= (A) AND (M) AND (S0) AND (NOT S1);
	O <= Sig1 OR Sig2 OR Sig3 OR Sig4 OR Sig5 OR Sig6 OR Sig7 OR Sig8;
END Behavior;