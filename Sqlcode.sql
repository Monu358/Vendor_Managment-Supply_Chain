-- Vendor master table
CREATE TABLE Vendors (
    VendorID VARCHAR(10) PRIMARY KEY,
    VendorName VARCHAR(100),
    Category VARCHAR(50),
    Region VARCHAR(50)
);

-- Delivery records
CREATE TABLE Deliveries (
    DeliveryID INT PRIMARY KEY,
    VendorID VARCHAR(10),
    DeliveryDate DATE,
    ExpectedDate DATE,
    DeliveryStatus VARCHAR(20), -- 'On-Time', 'Early', 'Late'
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
);

-- Freight cost records
CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY,
    VendorID VARCHAR(10),
    ShipmentDate DATE,
    FreightCost DECIMAL(10,2),
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
);

-- Quality checks
CREATE TABLE QualityChecks (
    CheckID INT PRIMARY KEY,
    VendorID VARCHAR(10),
    InspectionDate DATE,
    DeliveredUnits INT,
    RejectedUnits INT,
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
);

-- Sample Vendors
INSERT INTO Vendors VALUES 
('V0011', 'Alpha Supplies', 'Packaging', 'North'),
('V0021', 'Beta Logistics', 'Transport', 'West');

-- Sample Deliveries
INSERT INTO Deliveries VALUES 
(131, 'V0011', '2025-10-01', '2025-10-01', 'On-Time'),
(132, 'V0021', '2025-10-02', '2025-10-03', 'Early');

-- Sample Shipments
INSERT INTO Shipments VALUES 
(201, 'V0011', '2025-10-01', 120.00),
(202, 'V0021', '2025-10-02', 145.00);

-- Sample Quality Checks
INSERT INTO QualityChecks VALUES 
(301, 'V001', '2025-10-01', 1000, 12),
(302, 'V002', '2025-10-02', 800, 30);

