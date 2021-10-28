-- #########################################
-- ############# Entity Tables #############
-- #########################################


-- ########## Table 1: User Model ##########

-- Create User

INSERT INTO `user` (`userID`, `first_name`, `last_name`, `password`, `email`, `phone`) VALUES ('johnSmith1', 'John', 'Smith', 'E05F0889B84138BD8DF42DB442662D20A1223A94E0C05E68DEB1E18283AD96D3', 'smith@gmail.com', NULL); 

-- Read User by userID (single)

SELECT * FROM `user` WHERE `userID` = "johnSmith1";

-- Update User by userID

UPDATE `user` SET `first_name`="newFirstName", `last_name`="newLastName", password="ABDF0889B84138BD8DF42DB442662D20A1223A84E0C05E68DEB1E18283AD96D3", phone="(434)-201-1234" WHERE userID='johnSmith1';

-- Delete User by userID

DELETE FROM `user` WHERE `userID`="johnSmith1";



-- ########## Table 2: Group Model ##########

-- Create Group

INSERT INTO `group` (`groupID`, `group_name`, `description`, `location`) VALUES ('100', 'Tea Club', 'Description here', 'String decrpt of location');

-- Read Group by groupID (single)

SELECT * FROM `group` WHERE groupID = "100";

-- Update Group by groupID

UPDATE `group` SET group_name="new group name", description="new description", location="new location" WHERE groupID='100';

-- Delete Group by groupID

DELETE FROM `group` WHERE groupID=100;

-- Get all userID in group by groupID

SELECT userID FROM group_user WHERE group_user.groupID=3;

-- Read all groups of user by userID

SELECT groupID FROM group_user WHERE group_user.userID='bbahike23';



-- ########## Table 3: Tag Model ##########

-- Create Tag

INSERT INTO `tag` (`tagID`, `tag_name`, `description`) VALUES ('737', 'tagName', 'some description here');

-- Read Tag by tagID (single)

SELECT * FROM `tag` WHERE tagID=737;

-- Update Tag by tagID

UPDATE `tag` SET `tag_name`="new category", `description`="new description" WHERE `tagID`='737'; 

-- Delete Tag by tagID

DELETE FROM `tag` WHERE `tagID`='737';



-- ########## Table 4: Task Model ##########

-- Create Task

INSERT INTO `task` (`taskID`, `task_name`, `date_created`, `time_created`, `due_date`, `due_time`, `description`, `priority`, `location`, `completed`) VALUES ('1001', 'DB homework 7', '2020-10-21', '23:16:15', '2020-10-28', '22:16:15', 'group discussion on Sunday\r\nGo to office hours on Monday', '5', NULL, '0');

-- Read Task by taskID (single)

SELECT * FROM `task` WHERE taskID=1001;

-- Update Task by taskID

UPDATE `task` SET `task_name`="new task name", `description`="new description", `due_date`="2020-10-30", `due_time`="23:59:59", `description`="new description", `priority`="3", `location`=NULL, `completed`="1" WHERE `taskID`='1001';

-- Delete Task by taskID

DELETE FROM `task` WHERE `taskID`='1001';



-- ########## Table 5: TDList Model ##########

-- Create TDList

INSERT INTO `tdlist` (`listID`, `list_name`, `description`, `completed`) VALUES ('440', 'Done by Thursday', NULL, '0');

-- Read TDList by listID (single)

SELECT * FROM `tdlist` WHERE listID=440;

-- Update TDList by listID

UPDATE `tdlist` SET `list_name`="Do on Friday", `description`="new description", `completed`=1 WHERE `listID`='440';

-- Delete TDList by listID

DELETE FROM `tdlist` WHERE listID=440;

-- Get all listID that a user can access by userID

SELECT listID FROM `own_list` WHERE userID='bbahike23'
UNION
SELECT listID FROM `share_list` WHERE userID='bbahike23';

-- Get all userID who can access a list by listID

SELECT userID FROM `own_list` WHERE listID=3
UNION
SELECT userID FROM `share_list` WHERE listID=3;


-- ########## Table 6: Event Model ##########

-- Create Event

INSERT INTO `event` (`eventID`, `userID`, `start_date`, `start_time`, `end_date`, `end_time`) VALUES ('255', 'johnSmith', '2020-10-23', '05:08:52', '2020-10-23', '18:08:52');

-- Read Event by eventID (single)

SELECT * FROM `event` WHERE eventID=255;

-- Update Event by eventID

UPDATE `event` SET `start_date`="2020-10-27", `start_time`="05:59:59", `end_date`="2020-10-27", `end_time`="08:59:59" WHERE `eventID`='255';

-- Delete Event by eventID

DELETE FROM `event` WHERE eventID=255;

-- Get all eventID of a user on a given date (find by userID, start_date)

SELECT eventID FROM `event` WHERE userID = 'mkynnd2q' AND (start_date="2020-09-24" OR end_date="2020-09-24");



-- #########################################
-- ########## Relationship Tables ##########
-- #########################################

-- ########## Table 7: task_list ##########

-- Create Entry in task_list 
INSERT INTO `task_list` (`taskID`, `listID`) VALUES ('2', '4');

-- Read Entry in task_list 
SELECT * FROM `task_list` WHERE `taskID`='2' AND `listID`='4';

-- Update Entry in task_list 
UPDATE `task_list` SET `taskID`='2', `listID`='5' WHERE `taskID`='2' AND `listID`='4';

-- Delete Entry from task_list
DELETE FROM `task_list` WHERE taskID=2 AND listID=5;


-- ########## Table 8: tag_list ##########

-- Create Entry in tag_list 
INSERT INTO `tag_list` (`tagID`, `listID`) VALUES ('2', '4');

-- Read Entry in tag_list 
SELECT * FROM `tag_list` WHERE `tagID`='2' AND `listID`='4';

-- Update Entry in tag_list 
UPDATE `tag_list` SET `tagID`='2', `listID`='5' WHERE `tagID`='2' AND `listID`='4';

-- Delete Entry from tag_list
DELETE FROM `tag_list` WHERE tagID=2 AND listID = 5;

-- Read all list under Tag by tagID

SELECT listID FROM tag_list WHERE tag_list.tagID=3;

-- Read all tags of list by listID

SELECT tagID FROM tag_list WHERE tag_list.listID=3;



-- ########## Table 9: subgroup_of ##########

-- Create Entry in subgroup_of 
INSERT INTO `subgroup_of` (`parent_groupID`, `sub_groupID`) VALUES ('2', '4');

-- Read Entry in subgroup_of 
SELECT * FROM `subgroup_of` WHERE `parent_groupID`='2' AND `sub_groupID`='4';

-- Update Entry in subgroup_of 
UPDATE `subgroup_of` SET `parent_groupID`='2', `sub_groupID`='5' WHERE `parent_groupID`='2' AND `sub_groupID`='4';

-- Delete Entry from subgroup_of
DELETE FROM `subgroup_of` WHERE parent_groupID=2 AND sub_groupID = 5;


-- ########## Table 10: group_user ##########

-- Create Entry in group_user 
INSERT INTO `group_user` (`groupID`, `userID`) VALUES ('3', 'ahurnr');

-- Read Entry in group_user 
SELECT * FROM `group_user` WHERE `groupID`='3' AND `userID`='ahurnr';

-- Update Entry in group_user 
UPDATE `group_user` SET `groupID`='4' WHERE `groupID`='3' AND `userID`='ahurnr';

-- Delete Entry from group_user
DELETE FROM `group_user` WHERE groupID=4 AND userID='ahurnr';



-- ########## Table 11: event_task ##########

-- Create Entry in event_task 
INSERT INTO `event_task` (`eventID`, `taskID`) VALUES ('2', '4');

-- Read Entry in event_task 
SELECT * FROM `event_task` WHERE `eventID`='2' AND `taskID`='4';

-- Update Entry in event_task 
UPDATE `event_task` SET `eventID`='2', `taskID`='5' WHERE `eventID`='2' AND `taskID`='4';

-- Delete Entry from event_task
DELETE FROM `event_task` WHERE eventID=2 AND taskID = 5;



-- ########## Table 12-15: Onwership and Sharing Tasks/TDLists ##########

-- CRUD for share_list given userID, listID
INSERT INTO `share_list` (`userID`, `listID`, `permission`) VALUES ('ahurnr', '3', '1');
SELECT * FROM `share_list` WHERE `userID`='ahurnr' AND `listID`='3';
UPDATE `share_list` SET `permission`='2' WHERE `userID`='ahurnr' AND `listID`='3';
DELETE FROM `share_list` WHERE `userID`='ahurnr' AND `listID`='3';


-- CRUD for share_task given userID, listID
INSERT INTO `share_task` (`userID`, `taskID`, `permission`) VALUES ('ahurnr', '3', '1');
SELECT * FROM `share_task` WHERE `userID`='ahurnr' AND `taskID`='3';
UPDATE `share_task` SET `permission`='2' WHERE `userID`='ahurnr' AND `taskID`='3';
DELETE FROM `share_task` WHERE `userID`='ahurnr' AND `taskID`='3';


-- CRUD for own_task given userID, taskID
INSERT INTO `own_task` (`userID`, `taskID`) VALUES ('ahurnr', '3');
SELECT * FROM `own_task` WHERE `userID`='ahurnr' AND `taskID`='3';
UPDATE `own_task` SET `userID`='aalekhov40' WHERE `userID`='ahurnr' AND `taskID`='3';
DELETE FROM `own_task` WHERE `userID`='aalekhov40' AND `taskID`='3';


-- CRUD for own_list given userID, taskID
INSERT INTO `own_list` (`userID`, `listID`) VALUES ('ahurnr', '3');
SELECT * FROM `own_list` WHERE `userID`='ahurnr' AND `listID`='3';
UPDATE `own_list` SET `userID`='aalekhov40' WHERE `userID`='ahurnr' AND `listID`='3';
DELETE FROM `own_list` WHERE `userID`='aalekhov40' AND `listID`='3';


