LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY D0_ALU IS
    PORT(
        M         : IN  STD_LOGIC;
        S0        : IN  STD_LOGIC;
        S1        : IN  STD_LOGIC;
        OLeft     : OUT STD_LOGIC;
        ORight    : OUT STD_LOGIC
    );
END D0_ALU;

ARCHITECTURE Behavior OF D0_ALU IS
BEGIN
    OLeft  <= (NOT M) AND S1 AND (NOT S0);
    ORight <= (NOT M) AND S1 AND S0;
END Behavior;