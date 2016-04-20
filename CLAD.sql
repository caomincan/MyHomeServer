-- CLAD SQL Dump
-- version 1.0 by Miltoncao

-- Host: localhost
-- Generation Time: Mar 20, 2016
-- Server version: 5.1.50

-- Database: CLAD

USE CLAD;

DROP TABLE IF EXISTS `questionset`;

---------------------------------------------------------
--
-- Table structure for table 'questionset'
--
CREATE TABLE  IF NOT EXISTS `questionset` (
     `id` INT  NOT NULL Primary Key,
     `question` TEXT,`qpic` TEXT,
     `A` TEXT,`Apic` TEXT,
     `B` TEXT,`Bpic` TEXT,
     `C` TEXT,`Cpic` TEXT,
     `D` TEXT,`Dpic` TEXT,
     `answer` CHAR,`explain` TEXT   
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questionset`
--
INSERT INTO `questionset` VALUES
(1,'You must include the option to cancel when a user attempts to interactively close the front panel by selecting File>>Close. Which Event case allows this functionality.',null,
	null,'1A.png',
     null,'1B.png',
     null,'1C.png',
     null,'1D.png',
     'C','It is the only case with a filter event that applies to the Panel Close event. Since no Boolean is wired into the Filter Event terminal, LabVIEW opens a dialogue box to collect the value of the Boolean input.'),

(2,'You must generate code that responds to multiple value change events using a Boolean control while maintaining a latching mechanical action. Which programing step is NOT required?',null,
'Inculding or reading the boolean control terminal in a loop',null,
'Including the Event Structure within a loop',null,
'Configuring a Timeout case within the Event Strucutre',null,
'Configuring a Value Change event case for the Boolean control',null,
'C','The requirements have no timeout action specified. required to accomplish the stated goal.'),

(3,'What value is displayed in the Value Out indicator after the VI completes excution?','3.png',
'0',null,
'4',null,
'5',null,
'6',null,
'C','An empty array is wired to the For Loop using an auto-indexing tunnel. This causes the For Loop to iterate once for every element in the array, which, in this case, is zero. However, the value 5 is written to the shift register before loop execution, and since the loop iterates zero times, the same value of 5 is present at the output shift register.'),

(4,'How many errors does LabVIEW display at the end of execution?','4.png',
     'No Errors',null,
     'One Error',null,
     'Two Errors',null,
     'Three Errors',null,
'B','The Merge Errors VI only passes on the first error encountered, counting from the top node down.'),

(5,'You have been asked to write a VI called CLAD505 that will generate a path to test.txt. This txt file is in a folder called CLAD505_Support,and the folder is next to your VI. The VI must run on multiple platforms(Windows,Linux,etc.) Which diagram best illustrates how you should write the VI?',null,
null,'5A.png',
null,'5B.png',
null,'5C.png',
null,'5D.png',
'D','A and B are wrong because they do not strip the current VI filename from the path. C would work on Windows, but not other platforms, due to the different path separator. D is the only answer that correctly generates the path *and* will work on multiple platforms, since path separators in the path data type are automatically converted on different platforms.'),

(6,'Which of the following statements is TRUE about the following code segment?','6.png',
'The loop will execute once and the indicator Iteration will have a vaule of one',null,
'The loop will execute once and the indicator  Iteration will have a value of zero',null,
'The loop will execute continuously and the program will have to be aborted',null,
'The loop will not execute and the indicator interation will have a value of zero',null,
'C','The While Loop has a FALSE Boolean wired to its conditional terminal, which is set to Stop if TRUE. Thus, there is no condition that causes this While Loop to stop. So, the While Loop could run infinitely and the VI must be aborted.'),

(7,'Why is a shift register used for the file refnum input on the For Loop?','7.png',
     'If the Values to Write to File array is empty, the For Loop will run zero times, but refnum value will be passed through to the shift register output',null,
     'The Write to Text File function modifies the value of the refnum on each For Loop iteration',null,
     'It is the only way to prevent the For Loop from building an array at the refnum output terminal',null,
     'No reason. A regular tunnel would provide',null,
     'A','For Loops can run zero times, and using a shift register is the recommended way to preserve pass-through data in this scenario.'),

(8,'The following SubVI is loaded into memory and then run. At some later time it is still in memory and is run a second time. What is the value is displayed in the Sum indicator when the SubVI completes exacution the second time it is run?','8.png',
     '5',null,
     '10',null,
     'There is no way to know',null,
     '0',null,
     'B','The shift register value will be 5 on the second call. 5 + 5 = 10.'),

(9,'Which of following is FALSE about File I/O using binary or TDMS file formats?',null,
     'Binary files can accept any LabVIEW data type',null,
     'TDMS can accept any LabVIEW data type',null,
     'TDMS is generally faster in writing than binary',null,
     'Binary file I/O can be used by all versions of LabVIEW',null,
     'B','TDMS read/write is limited to a specific subset of LabVIEW data types. For example, it cannot read or write multidimensional arrays or arrays of timestamps. See the LabVIEW help for details.'),

(10,'How does a producer consumer design pattern process excessive amounts of data?',null,
     'Using a single element queue the Producer Consumer processers only current data.',null,
     'Using a queue for  storage the Consumer loop processers all data when it has time.',null,
     'The Producer loop will slow its cycle time to allow the consumer loop to catch up.',null,
     'he consumer loop will increase its processing time to match the producer loop.',null,
     'B','Textbook use of queue in Producer Consumer.'),

(11,'Unlike graphs, which display an entire waveform that ________ the data already displayed, charts update periodically and ________ the data previously displayed.',null,
     'Maintains a history of; overwrite',null,
     'Overwrites; maintain a history of',null,
     'Appends to; overwrite',null,
     'None of the above',null,
     'B','Answer B is the difference between charts and graphs.'),

(12,'What value is displayed in the Result indicator after the VI completes execution?','12.png',
     '3',null,
     '2',null,
     '1',null,
     '0',null,
     'B','In three loops only zeros will pass from the register, but the iteration will count 0, then 1 & then 2. Therefore the output from the addition function will be 0+2=2.'),

(13,'After the VI starts running, the user clicks the "Event1" button twice. The event structure has no other event cases. What will be displayed in the "Time 1" indicator when the VI stops executing?','13.png',
     '0',null,
     '1',null,
     '2',null,
     'Undertermined',null,
     'B','The events queue up, so if it were not for the TRUE wired to the loop condition, the answer would be 2. However, the loop ends before we can process the second event that is still in the queue.'),

(14,'You have written a LabVIEW VI with three parallel code paths. All three error cluster wires are wired into a Merge Errors funcion. What error is reported to the user?','14.png',
     'Error 1014, because Merge Errors outputs the first error to occur chronologically',null,
     'Error 7, because Merge Errors outputs the first error wired in to it from the top down',null,
     'Error 1, because Merge Errors outputs the most significant error of the errors wired in to it',null,
     'All three errors are reported,because Merge Errors concatenates the errors into a single error message to display to the user',null,
     'B','Merge Errors outputs the first error it finds in the errors clusters wired into it in a top-down fashion. Error 7 is wired into the top input, so it is the error outputted by Merge Errors.'),

(15,'Which timing function can result in logic errors when it rolls over to zero?',null,
     null,'15A.png',
     null,'15B.png',
     null,'15C.png',
     null,'15D.png',
     'B','The Tick Count (ms) is the only timer that rolls over to 0.'),

(16,'You select "Create SubVI" from LabVIEW\'s Edit menu with the code below selected. What will the resulting block diagram look like?','16.png',
     null,'16A.png',
     null,'16B.png',
     null,'16C.png',
     null,'16D.png',
'B','Input Numeric and Input Array are constants, so they are internal to the SubVI and do not have input terminals.'),

(17,'What value will be displayed in the subarray indicator after the following code has executed?','17.png',
     null,'17A.png',
     null,'17B.png',
     null,'17C.png',
     null,'17D.png',
     'C','The Array Subset function takes an input array and returns a section of that array as specified, starting at the given index and continuing for a number of elements equal to length. Here, the index value 3 specifies the fourth element of the array, or 10. Since the specified length is value 4, an array of length 4 is returned as follows: {10, 8, 5, 7}.'),

(18,'Which of the following statements is NOT valid?',null,
     'You can make a Cluster of Clusters',null,
     'You can make an Array of Arrays',null,
     'You can make a CLuster of Arrays',null,
     'You can make an Array of CLusters',null,
     'B','LabVIEW will not allow creation of an array of arrays -- There is no need to make an array of arrays since you can simply add dimensions to an existing array.'),

(19,'Which of the following cannot be used to transfer data between two parallel loops?',null,
     'Wires',null,
     'Queues',null,
     'Notifiers',null,
     'Local variables',null,
     'A','Queues, notifiers, and local variables are all designed to transfer data. Wires can not pass data between parallel loops.'),

(20,'The time out input terminal of the Dequeue Element function is wired with value 1. While the VI is running, how long does this Dequeue Element function wait to receive data?','20.png',
     '1 millisecond',null,
     '1 second',null,
     'Indefinitely',null,
     'It does not wait. It returns immediately',null,
     'A','The time out input terminal of the Dequeue Element function is in milliseconds, so with an input of 1, the Dequeue Element function will wait 1 millisecond to receive data.'),

(21,'What does this function do?','21.png',
     'Transfer the queue reference to other callers',null,
     'Sorts all queue elements in order and returns them as an array',null,
     'Clears all elements from the queue',null,
     'Removes one reference to the queue and returns any remaining elements',null,
     'D','One reference is removed from memory, and the remaining elements are returned. It can be used to destroy the queue, but this is not an option in the question.'),

(22,'When a VI is paused, clicking on the _______ button allows you to bypass a node in the BLock Diagram without single-stepping through the node.',null,
     'Step Into',null,
     'Step Over',null,
     'Step Out',null,
     'Step Through',null,
     'B','Clicking the Step Into button causes LabVIEW to open up the node or subVI. The Step Out button is used to return from a subVI to a main VI while single-stepping. There is no Step Through button. Step Over provides the functionality stated by the question, therefore this is the correct answer.'),

(23,'Which is a native debugging feature in LabVIEW?',null,
'Step Back',null,
'Step Over',null,
'Step Around',null,
'Step Above',null,
'B','Stepping back, around,or above are not single step actions, stepping Over is the only correct choice.'),

(24,'Which data type is not accepted by the case selector terminal on a case structure?',null,
'Arrays',null,
'Enumerated type values',null,
'Strings',null,
'Integers',null,
'A','Arrays are not accepted by the case selector terminal because the case selector terminal requires a scalar value.'),

(25, 'Which statement about sequence structures is FALSE?',null,
'Sequence structures support parallel operations within frames.',null,
'Terminating the execution of a sequence structure before the entire sequence is completed is not possible without aborting.',null,
'Sequence structures execute frames in a sequential order.',null,
'Sequence structures stop when an error is detected.',null,
'D','Sequence Structures have no error terminals.'),

(26,'Which equation is equivalent to the code?','26.png',
null,'26A.png',
null,'26B.png',
null,'26C.png',
null,'26D.png',
'A','Because LabVIEW is a Dataflow language, we can trace the flow of data in the block diagram to see which operations execute first, second, and so forth.'),

(27,'When clicking a broken run arrow, the Error list window shows all of the following EXCEPT:',null,
'Items with errors',null,
'Errors and warnings',null,
'Deatails about the warnings',null,
'Error Codes',null,
'D','You must either look at an output error cluster or an error dialog to find the error code.'),


(28,'How do you document a VI so that the description appears in the Show Context Help popup window?',null,
'Use the VI properties Documentation window',null,
'Type in the Show Context Help window',null,
'Create a free label on the front panel',null,
'Edit the LabVIEW help files',null,
'A','The documentation window in VI Properties is the only place to edit the information about the VI that appears in Context Help.'),

(29,'What is the output of the Initialize Array function after the following code has completed execution?','29.png',
null,'29A.png',
null,'29B.png',
null,'29C.png',
null,'29D.png',
'A','The "element" input terminal contains the value each element of the initialized array will contain, and the "dimension size" input terminal dictates the size of each dimension of the initialized array. Since there is only one dimension size input terminal, the array will be only 1 dimensional. The array elements will be initialized to the value of the element.'),

(30,'How many bytes does LabVIEW write to the file when the code executes?','30.png',
'5 Bytes',null,
'6 Bytes',null,
'12 Bytes',null,
'14 Bytes',null,
'D','LabVIEW represents arrays as a list of bytes containing a header and array data. The header contains a 4-byte integer for each dimension that specifies the length of that dimension. Following the header is the actual array data. In the question, the array has two dimensions. There are 4 bytes in the header for each dimension for a total of 8 bytes in the header. Since the array is composed of six 8-bit, or 1-byte integers, there is a total of 6 bytes of actual array data. This makes a total of 14 bytes being written to file.'),

(31,'The value in Control a is 2 and in Control b is 128. What value does the Result indicator display after the VI executes?','31.png',
'-128',null,
'0',null,
'255',null,
'256',null,
'B','The integers shown are unsigned 8-bit integers. The range for 8-bit integers is 0-255. The product of 2 times 128 is 256. As 256 is a number larger than the allowable 255, thus 256 wraps to 0.'),


(32,'A SubVI is created by selecting the code from a block diagram. How many terminals will the SubVI have?','32.png',
'3',null,
'4',null,
'5',null,
'6',null,
'C','The subVI will have Error In/Out terminals as well as the three controls, for a total of 5 terminals.'),

(33, 'What is the red dot called?','33.png',
'Coercion Dot',null,
'Data truncation Dot',null,
'Data typecast Dot',null,
'Buffer allocation Dot',null,
'A','Definition of Coercion Dot'),

(34,'What do coercion dots indicate?',null,
'Incompatible data types',null,
'A mathematical operation will be performed on the data',null,
'The input data will be copied and converted to a different data type',null,
'The location where an error will occur',null,
'C','Definition of Coercion Dots'),

(35,'What setting should be selected for a custom control so that all copies of the control are of the same data type yet have the flexibility to use different colors and styles?',null,
'Control',null,
'Type Def.',null,
'Strict Type Def.',null,
'Flex Def.',null,
'B','Definition of Type Def'),

(36,'In a Simple State Machine design pattern, which of the following stores the state information?',null,
'Shift Register',null,
'Queue',null,
'Notifier',null,
'Functional global variable',null,
'A','Definition of Shift Register'),

(37,'You are required to use the Get Date/Time in Seconds function for timing in a state machine. The state machine has an acquire state and must acquire for 5 seconds. If the hardware fails during acquisition the state machine must be able to transition to the stop state.Which of the following design patterns will provide timing for a state machine and allow responsiveness to acquire state requirements?',null,
null,'37A.png',
null,'37B.png',
null,'37C.png',
null,'37D.png',
'A','A is the only case that checks the data and leaves the timing state, and has persistent start time (stored in the shift register'),

(38,'Which of following apply to Property Nodes? Property Nodes:',null,
'allow attributes of files on disk to be programmatically manipulated',null,
'can be used to update the value of a front panel control or indicator',null,
'return an error if you attempt to read a property before it has been written',null,
'can be used to invoke methods on a control',null,
'B','Deffinition of a property node.'),

(39,'You have a front panel control on a top-level VI that you must manipulate from within a SubVI.Which of the following could you pass to the SubVI to accomplish this?',null,
'The control\'s properties',null,
'The control\'s methods',null,
'The control\'s reference',null,
'The control\'s data type',null,
'C','The only answer option that can be passed from calling VI to subVI is the control reference. The reference can then be used with Property Nodes and Invoke Nodes to call properties and methods, respectively. The data type is a property of the control.'),

(40,'Which Property Node can change the text color attributes of ANY digital numeric control used on the panel of a VI?',null,
     null,'40A.png',
     null,'40B.png',
     null,'40C.png',
     null,'40D.png',
     'B','Strict property nodes require precise knowledge of the numeric representation. Since the question asks for the means to change the text color of any control, a strict Property Node does not suffice. An implicit Property Node (C), can only be used locally. Answer D shows a property that is not even relevant to the question. Thus, option B is the best answer.')

;
DROP TABLE IF EXISTS `userprofile`;
DROP TABLE IF EXISTS `users`;

create table if not exists `users` 
     ( ID int not null AUTO_INCREMENT,
	   usrname varchar(10) not null unique,
	   usrpsd  varchar(10) not null,
       primary key (ID)
       );
       
insert into `users` values
     (1,'mincan','abc1234'),
     (2,'xiaolang','asdfghjkl');



create table if not exists `userprofile`
      ( ID int not null,
        lastname varchar(255) not null,
        firstname varchar(255) not null,
        tel     varchar(10),
        primary key(ID),
        foreign key(ID) references users(ID)
        );
        
insert into userprofile values 
     (1,'Mincan','Cao','5453791234'),
     (2,'Xiaolang','Li','1234567890');
     
drop user if exists 'usradmin'@'localhost';
create user if not exists 'usradmin'@'localhost';
set password for 'usradmin'@'localhost'='admin';
grant select,insert,create view, grant option on CLAD.users to usradmin@localhost;
grant select,insert,create view, grant option on CLAD.userprofile to usradmin@localhost;


