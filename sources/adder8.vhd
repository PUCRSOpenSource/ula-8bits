library ieee;
use ieee.std_logic_1164.all;
entity adder8 is
    port
    (      
        cin     :in std_logic;
        a, b    :in std_logic_vector (7 downto 0);

        cout    :out std_logic;
        s       :out std_logic_vector (7 downto 0)
    );
end adder2;

architecture adder08 of adder8 is
    signal c: std_logic_vector(1 downto 0);
begin
    A0: entity work.Adder4
        port map( cin => '0' , a => a(3 downto 0), b =>b(3 downto 0), cout => c(0), s=>s(3 downto 0));
    A1: entity work.Adder4
        port map( cin => '0' , a => a(7 downto 4), b =>b(7 downto 4), cout => c(1), s=>s(7 downto 4)); 
    cout <= c(1);
end adder08;
