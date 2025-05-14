create database farm_management;
use farm_management;
-- Table for storing crop information
CREATE TABLE Crops (
    CropID INT PRIMARY KEY,
    CropName VARCHAR(100),
    Season VARCHAR(50),
    Duration INT,  -- in days
    AvgYieldPerAcre DECIMAL(10,2),  -- in kg
    MarketPrice DECIMAL(10,2)  -- per kg in INR
);

-- Table for storing field information
CREATE TABLE Fields (
    FieldID INT PRIMARY KEY,
    Area DECIMAL(10,2),  -- in acres
    SoilType VARCHAR(50),
    Location VARCHAR(255)
);

-- Table for storing planting details
CREATE TABLE Plantings (
    PlantingID INT PRIMARY KEY,
    CropID INT,
    FieldID INT,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50),  -- E.g., 'Planted', 'Harvested', 'In Progress'
    FOREIGN KEY (CropID) REFERENCES Crops(CropID),
    FOREIGN KEY (FieldID) REFERENCES Fields(FieldID)
);

-- Table for storing fertilizer application data
CREATE TABLE FertilizerApplications (
    AppID INT PRIMARY KEY,
    FieldID INT,
    FertilizerType VARCHAR(100),
    Quantity DECIMAL(10,2),  -- in kg
    ApplicationDate DATE,
    FOREIGN KEY (FieldID) REFERENCES Fields(FieldID)
);

-- Table for storing rainfall data
CREATE TABLE RainfallData (
    Date DATE,
    FieldID INT,
    Rainfall_mm DECIMAL(5,2),  -- in mm
    PRIMARY KEY (Date, FieldID),
    FOREIGN KEY (FieldID) REFERENCES Fields(FieldID)
);

-- Table for storing machinery maintenance details
CREATE TABLE MachineryMaintenance (
    MachineID INT PRIMARY KEY,
    MachineType VARCHAR(100),
    LastServiceDate DATE,
    HoursRun DECIMAL(10,2),
    Status VARCHAR(50)  -- E.g., 'Operational', 'Needs Service'
);

-- Table for storing labor cost and task data
CREATE TABLE Labor (
    LaborID INT PRIMARY KEY,
    TaskType VARCHAR(100),
    FieldID INT,
    Hours DECIMAL(10,2),  -- in hours
    Cost DECIMAL(10,2),  -- in INR
    TaskDate DATE,
    FOREIGN KEY (FieldID) REFERENCES Fields(FieldID)
);

-- Table for storing sales data
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CropID INT,
    QuantityKg DECIMAL(10,2),  -- in kg
    PricePerKg DECIMAL(10,2),  -- in INR
    SaleDate DATE,
    FOREIGN KEY (CropID) REFERENCES Crops(CropID)
);

-- Sample data for Crops table
INSERT INTO Crops (CropID, CropName, Season, Duration, AvgYieldPerAcre, MarketPrice)
VALUES 
(1, 'Wheat', 'Rabi', 120, 2500.00, 30.00),
(2, 'Rice', 'Kharif', 150, 3000.00, 25.00),
(3, 'Sugarcane', 'Year-Round', 365, 15000.00, 20.00);

-- Sample data for Fields table
INSERT INTO Fields (FieldID, Area, SoilType, Location)
VALUES 
(1, 10, 'Loamy', 'Pandharpur'),
(2, 15, 'Clay', 'Madhavnagar');

-- Sample data for Plantings table
INSERT INTO Plantings (PlantingID, CropID, FieldID, StartDate, EndDate, Status)
VALUES 
(1, 1, 1, '2025-01-01', '2025-05-01', 'Planted'),
(2, 2, 2, '2025-06-01', '2025-10-01', 'Planted');

-- Sample data for FertilizerApplications table
INSERT INTO FertilizerApplications (AppID, FieldID, FertilizerType, Quantity, ApplicationDate)
VALUES 
(1, 1, 'Urea', 100, '2025-02-01'),
(2, 2, 'DAP', 120, '2025-07-01');

-- Sample data for RainfallData table
INSERT INTO RainfallData (Date, FieldID, Rainfall_mm)
VALUES 
('2025-01-01', 1, 10.5),
('2025-06-01', 2, 12.3);

-- Sample data for MachineryMaintenance table
INSERT INTO MachineryMaintenance (MachineID, MachineType, LastServiceDate, HoursRun, Status)
VALUES 
(1, 'Tractor', '2025-01-01', 150, 'Operational'),
(2, 'Combine Harvester', '2025-06-01', 200, 'Needs Service');

-- Sample data for Labor table
INSERT INTO Labor (LaborID, TaskType, FieldID, Hours, Cost, TaskDate)
VALUES 
(1, 'Ploughing', 1, 5, 1000, '2025-01-01'),
(2, 'Planting', 2, 8, 2000, '2025-06-01');

-- Sample data for Sales table
INSERT INTO Sales (SaleID, CropID, QuantityKg, PricePerKg, SaleDate)
VALUES 
(1, 1, 5000, 30.00, '2025-05-10'),
(2, 2, 7000, 25.00, '2025-10-10');

SELECT SUM(QuantityKg * PricePerKg) AS TotalRevenue
FROM Sales;

SELECT CropName, AVG(AvgYieldPerAcre) AS AvgYieldPerAcre
FROM Crops
GROUP BY CropName;

SELECT TaskType, SUM(Cost) AS TotalLaborCost
FROM Labor
GROUP BY TaskType;

SELECT F.Location, SUM(FertilizerApplications.Quantity) AS TotalFertilizerUsed
FROM FertilizerApplications
JOIN Fields F ON FertilizerApplications.FieldID = F.FieldID
GROUP BY F.Location;
