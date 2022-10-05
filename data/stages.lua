-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 19,
		multiplier = 120
	}, {
		minlevel = 20,
		maxlevel = 50,
		multiplier = 100
	}, {
		minlevel = 51,
		maxlevel = 80,
		multiplier = 65
	}, {
		minlevel = 81,
		maxlevel = 100,
		multiplier = 50
	}, {
		minlevel = 101,
		maxlevel = 150,
		multiplier = 35
	}, {
		minlevel = 151,
		maxlevel = 180,
		multiplier = 30
        }, {
		minlevel = 181,
		maxlevel = 200,
		multiplier = 25
	}, {
	        minlevel = 201,
		maxlevel = 250,
		multiplier = 22
        }, {
	        minlevel = 251,
		maxlevel = 400,
		multiplier = 20
        }, {
	        minlevel = 401,
		maxlevel = 700,
		multiplier = 18
        }, {
                minlevel = 701,
		maxlevel = 1050,
		multiplier = 16
        }, {


                minlevel = 1051,
		multiplier = 10
	}
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 40
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 20
	}, {
		minlevel = 81,
		maxlevel = 110,
		multiplier = 8
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 3
	}, {
		minlevel = 126,
		multiplier = 2
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 40
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 20
	}, {
		minlevel = 81,
		maxlevel = 100,
		multiplier = 10
	}, {
		minlevel = 101,
		maxlevel = 110,
		multiplier = 4
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 2
	}, {
		minlevel = 126,
		multiplier = 1
	}
}
