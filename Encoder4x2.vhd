LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Encoder4x2 IS
    PORT(
        I    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        O    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END Encoder4x2;

ARCHITECTURE Behavior OF Encoder4x2 IS
BEGIN
    PROCESS(I)
    BEGIN
        CASE I IS
            WHEN "0001" =>
                O <= "00";
            WHEN "0010" =>
                O <= "01";
            WHEN "0100" =>
                O <= "10";
            WHEN "1000" =>
                O <= "11";
            WHEN OTHERS =>
                O <= "00";
        END CASE;
    END PROCESS;
END Behavior;
