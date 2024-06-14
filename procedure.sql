DELIMITER //
CREATE PROCEDURE joinTable (tableFirst VARCHAR(255), tableSecond VARCHAR(255))
BEGIN
    IF tableFirst = "Sector" THEN
        IF tableSecond = "Objects" THEN
            SELECT s.*, o.* FROM Sector s
            INNER JOIN Researches c ON s.id = c.sector_id
            INNER JOIN Objects o ON c.object_id = o.id;
        END IF;
        IF tableSecond = "Locations" THEN
            SELECT s.*, l.* FROM Sector s
            INNER JOIN Researches c ON s.id = c.sector_id
            INNER JOIN Locations l ON c.location_id = l.id;
        END IF;
        IF tableSecond = "NaturalObjects" THEN
            SELECT s.*, n.* FROM Sector s
            INNER JOIN Researches c ON s.id = c.sector_id
            INNER JOIN NaturalObjects n ON c.natural_object_id = n.id;
        END IF;
     END IF;
     IF tableFirst = "Objects" THEN
        IF tableSecond = "Sector" THEN
            SELECT o.*, s.* FROM Objects o
            INNER JOIN Researches c ON o.id = c.object_id
            INNER JOIN Sector s ON c.sector_id = s.id;
        END IF;
        IF tableSecond = "Locations" THEN
            SELECT o.*, l.* FROM Objects o
            INNER JOIN Researches c ON o.id = c.object_id
            INNER JOIN Locations l ON c.location_id = l.id;
        END IF;
        IF tableSecond = "NaturalObjects" THEN
            SELECT o.*, n.* FROM Objects o
            INNER JOIN Researches c ON o.id = c.object_id
            INNER JOIN NaturalObjects n ON c.natural_object_id = n.id;
        END IF;
      END IF;
      IF tableFirst = "Locations" THEN
        IF tableSecond = "Sector" THEN
            SELECT l.*, s.* FROM Locations l
            INNER JOIN Researches c ON l.id = c.location_id
            INNER JOIN Sector s ON c.sector_id = s.id;
        END IF;
        IF tableSecond = "Objects" THEN
            SELECT l.*, o.* FROM Locations l
            INNER JOIN Researches c ON l.id = c.location_id
            INNER JOIN Objects o ON c.object_id = o.id;
        END IF;
        IF tableSecond = "NaturalObjects" THEN
            SELECT l.*, n.* FROM Locations l
            INNER JOIN Researches c ON l.id = c.location_id
            INNER JOIN NaturalObjects n ON c.natural_object_id = n.id;
        END IF;
      END IF;
      IF tableFirst = "NaturalObjects" THEN
        IF tableSecond = "Sector" THEN
            SELECT n.*, s.* FROM NaturalObjects n
            INNER JOIN Researches c ON n.id = c.natural_object_id
            INNER JOIN Sector s ON c.sector_id = s.id;
        END IF;
        IF tableSecond = "Objects" THEN
            SELECT n.*, o.* FROM NaturalObjects n
            INNER JOIN Researches c ON n.id = c.natural_object_id
            INNER JOIN objects o ON c.object_id = o.id;
        END IF;
        IF tableSecond = "Locations" THEN
            SELECT n.*, l.* FROM NaturalObjects n
            INNER JOIN Researches c ON n.id = c.natural_object_id
            INNER JOIN Locations l ON c.location_id = l.id;
        END IF;
      END IF;
END //
DELIMITER ;