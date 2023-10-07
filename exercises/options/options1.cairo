// options1.cairo
// Execute `starklings hint options1` or use the `hint` watch subcommand for a hint.


use option::OptionTrait;

// This function returns how much icecream there is left in the fridge.
// If it's before 10PM, there's 5 pieces left. At 10PM, someone eats them
// all, so there'll be no more left :(
fn maybe_icecream(
    time_of_day: usize
) -> Option<usize> { 
    if time_of_day <= 10_usize {
        Option::Some(5_usize)
    } else if time_of_day > 23_usize {
        Option::None(())
    } else {
        Option::Some(0_usize)
    }
}

#[test]
fn check_icecream() {
    assert(maybe_icecream(9).unwrap() == 5, 'err_1');
    assert(maybe_icecream(10).unwrap() == 5, 'err_2');
    assert(maybe_icecream(23).unwrap() == 0, 'err_3');
    assert(maybe_icecream(22).unwrap() == 0, 'err_4');
    assert(maybe_icecream(25).is_none(), 'err_5');
}

#[test]
fn raw_value() {
    let icecreams = maybe_icecream(12);
    assert(icecreams == Option::Some(0_usize), 'err_6');
}
