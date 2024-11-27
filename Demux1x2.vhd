LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Demux1X2 IS
    PORT(
        I    : IN  STD_LOGIC;
        S    : IN  STD_LOGIC;
        O    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END Demux1X2;

ARCHITECTURE Behavior OF Demux1X2 IS
BEGIN
    PROCESS(I, S)
    BEGIN
        CASE S IS
            WHEN '0' =>
                O(0) <= I;
                O(1) <= '0';
            WHEN '1' =>
                O(1) <= I;
                O(0) <= '0';
            WHEN OTHERS =>
                O <= "ZZ";
        END CASE;
    END PROCESS;
END Behavior;
