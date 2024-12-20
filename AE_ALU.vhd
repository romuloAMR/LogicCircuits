LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY AE_ALU IS
    PORT(
		B  : IN  STD_LOGIC;
      M  : IN  STD_LOGIC;
      S0 : IN  STD_LOGIC;
      S1 : IN  STD_LOGIC;
      O  : OUT STD_LOGIC
    );
END AE_ALU;

ARCHITECTURE Behavior OF AE_ALU IS
SIGNAL Sig1, Sig2 : STD_LOGIC;
BEGIN
	Sig1 <= B AND (NOT S0) AND (NOT S1);
   Sig2 <= (NOT B) AND S0 AND (NOT S1);
	O <= (NOT M) AND (Sig1 OR Sig2);
END Behavior;