LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Shift_16bit IS
    PORT(
        Input    : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        Serial   : IN STD_LOGIC;
        ShiftR   : IN STD_LOGIC;
        ShiftL   : IN STD_LOGIC;
        Output   : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END Shift_16bit;

ARCHITECTURE Behavioral OF Shift_16bit IS
    COMPONENT Mux4X1
        PORT(
            I : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            S : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
            O : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL Selector : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    Selector(0) <= ShiftL;
    Selector(1) <= ShiftR;

    MUX0: Mux4X1 PORT MAP (
        I => (Input(0), Input(1), Serial, Input(0)),
        S => Selector,
        O => Output(0)
    );

    MUX1: Mux4X1 PORT MAP (
        I => (Input(1), Input(2), Input(0), Input(1)),
        S => Selector,
        O => Output(1)
    );

    MUX2: Mux4X1 PORT MAP (
        I => (Input(2), Input(3), Input(1), Input(2)),
        S => Selector,
        O => Output(2)
    );

    MUX3: Mux4X1 PORT MAP (
        I => (Input(3), Input(4), Input(2), Input(3)),
        S => Selector,
        O => Output(3)
    );

    MUX4: Mux4X1 PORT MAP (
        I => (Input(4), Input(5), Input(3), Input(4)),
        S => Selector,
        O => Output(4)
    );

    MUX5: Mux4X1 PORT MAP (
        I => (Input(5), Input(6), Input(4), Input(5)),
        S => Selector,
        O => Output(5)
    );

    MUX6: Mux4X1 PORT MAP (
        I => (Input(6), Input(7), Input(5), Input(6)),
        S => Selector,
        O => Output(6)
    );

    MUX7: Mux4X1 PORT MAP (
        I => (Input(7), Input(8), Input(6), Input(7)),
        S => Selector,
        O => Output(7)
    );

    MUX8: Mux4X1 PORT MAP (
        I => (Input(8), Input(9), Input(7), Input(8)),
        S => Selector,
        O => Output(8)
    );

    MUX9: Mux4X1 PORT MAP (
        I => (Input(9), Input(10), Input(8), Input(9)),
        S => Selector,
        O => Output(9)
    );

    MUX10: Mux4X1 PORT MAP (
        I => (Input(10), Input(11), Input(9), Input(10)),
        S => Selector,
        O => Output(10)
    );

    MUX11: Mux4X1 PORT MAP (
        I => (Input(11), Input(12), Input(10), Input(11)),
        S => Selector,
        O => Output(11)
    );

    MUX12: Mux4X1 PORT MAP (
        I => (Input(12), Input(13), Input(11), Input(12)),
        S => Selector,
        O => Output(12)
    );

    MUX13: Mux4X1 PORT MAP (
        I => (Input(13), Input(14), Input(12), Input(13)),
        S => Selector,
        O => Output(13)
    );

    MUX14: Mux4X1 PORT MAP (
        I => (Input(14), Input(15), Input(13), Input(14)),
        S => Selector,
        O => Output(14)
    );

    MUX15: Mux4X1 PORT MAP (
        I => (Input(15), Serial, Input(14), Input(15)),
        S => Selector,
        O => Output(15)
    );
END Behavioral;
