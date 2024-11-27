LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Mux2x1 IS
    PORT(
        I    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        S    : IN  STD_LOGIC;
        O    : OUT STD_LOGIC
    );
END Mux2x1;

ARCHITECTURE Behavior OF Mux2x1 IS
BEGIN
    PROCESS(I, S)
    BEGIN
        CASE S IS
            WHEN '0' =>
                O <= I(0);
            WHEN '1' =>
                O <= I(1);
            WHEN OTHERS =>
                O <= '0';
        END CASE;
    END PROCESS;
END Behavior;