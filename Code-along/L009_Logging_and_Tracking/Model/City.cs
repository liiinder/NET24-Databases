﻿namespace L009_Logging_and_Tracking.Model;

public class City
{
    public int Id { get; set; }
    public string Name { get; set; }

    public Country Country { get; set; }
}
