testdcl1

: dialog

{
label = "test Dialog 1";
	: edit_box
	{
	label = "Enter your name";
	mnemonic = "N";
	key = "name";
	alignment = centered;
	edit_limit = 30;
	edit_width = 30;
	}

	: edit_box
	{
	label = "Enter your Age";
	mnemonic = "A";
	key = "age";
	alignment = centered;
	edit_limit = 3;
	edit_width = 3;
	value = "";
	}

	: button
	{
	key = "accept";
	label = "OK";
	is_default = true;
	fixed_width = true;
	alignment = centered;
	}

	: errtile
	{
	width = 34;
	}

}