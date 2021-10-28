-- TWO TYPES OF ADVANCED SQL HERE

-- ####### CHECK contraint #######
CREATE TABLE `task` (
  `taskID` decimal(10,0) NOT NULL DEFAULT 0,
  `task_name` varchar(255) NOT NULL,
  `date_created` date NOT NULL,
  `time_created` time NOT NULL,
  `due_date` date NOT NULL,
  `due_time` time NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` decimal(1,0) NOT NULL DEFAULT 0 CHECK (`priority` >= 0 and `priority` <= 5),
  `location` varchar(255) DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ####### Stored Procedure 1 #######
DELIMITER $$
CREATE PROCEDURE computeListDueDate(IN currListID DECIMAL(10,0),
                               	    OUT listDueDate DATE)
SELECT MAX(due_date)
FROM task_list NATURAL JOIN task
WHERE listID=currListID
$$
DELIMITER ;
-- ------- Exemplary calling -------
-- SET @p0='1';
-- CALL computeListDueDate(@p0, @p1);
-- SELECT @p1 as listDueDate;


-- ####### Stored Procedure 2 #######
DELIMITER $$
CREATE PROCEDURE changeTaskDueDate(IN currTaskID DECIMAL(10,0),
                               	   IN newDueDate DATE)
UPDATE task
SET due_date = newDueDate
WHERE taskID = currTaskID;
$$
DELIMITER ;
-- ------- Exemplary calling -------
-- SET @p0='1'; SET @p1='2020-12-31'; 
-- CALL changeTaskDueDate(@p0, @p1);

