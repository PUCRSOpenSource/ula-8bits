library ieee;
use ieee.std_logic_1164.all;
entity adder4 is
    port
    (      
        cin     :in std_logic;
        a, b    :in std_logic_vector (3 downto 0);

        cout    :out std_logic;
        s       :out std_logic_vector (3 downto 0)
    );
end adder4;

architecture adder04 of adder4 is
    signal c: std_logic_vector(1 downto 0);
begin
    A0: entity work.Adder2
        port map( cin => '0' , a => a(1 downto 0), b =>b(1 downto 0), cout => c(0), s=>s(1 downto 0));
    A1: entity work.Adder2
        port map( cin => '0' , a => a(3 downto 2), b =>b(3 downto 2), cout => c(1), s=>s(3 downto 2)); 
    cout <= c(1);
end adder04;
