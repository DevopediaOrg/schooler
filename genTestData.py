#====================================================================
# Syntax      : genTestData.py
# Description : Generate DB data for test purposes.
# Author      : AP
# Date        : 3 May 2014
#--------------------------------------------------------------------


#====================================================================
# Imports
#--------------------------------------------------------------------
import random;
import collections;
import datetime;
import re;
import sys;


#====================================================================
# Initializations
#--------------------------------------------------------------------
personNames = ['Adelle Stmartin', 'Adena Ricken', 'Adina Ridgeway', 'Alan Causey', 'Alena Girton', 'Alene Vinton', 'Alessandra Shewmaker', 'Amada Matis', 'Amish Gire', 'Amy Macarthur', 'Antionette Zalewski', 'Ardelia Elias', 'Ariana Newbill', 'Arianne Escudero', 'Arminda Collington', 'Arturo Baxter', 'Aurora Fichter', 'Benedict Teasdale', 'Bobby Yarber', 'Bonita Crittendon', 'Brianna Oxford', 'Bud Bartolomeo', 'Camille Kniffen', 'Carolann Kies', 'Cecily Burr', 'Chantell Gathers', 'Chauncey Devlin', 'Christal Delrosario', 'Cristin Sutter', 'Dalene Fritz', 'Danica Cable', 'Daron Byrns', 'Dasa Balakrishnan', 'Dasras Murthy', 'Davis Stump', 'Deangelo Brecht', 'Delorse Sievers', 'Deon Woltz', 'Derick Pinckard', 'Dhenuka Bhandari', 'Dusti Mazzola', 'Dwain Klingbeil', 'Dwayne Lefebre', 'Eboni Falkowski', 'Eilene Gerstein', 'Errol Callihan', 'Evie Mabrey', 'Florencia Schurman', 'Francis Lamkin', 'Frankie Hartfield', 'Gaylord Atienza', 'Graham Velarde', 'Gwenn Balch', 'Halley Shima', 'Hastin Modi', 'Haydee Maranto', 'Hien Mule', 'Hillary Petrella', 'Holly Squires', 'Indra Hayer', 'Isabella Morriss', 'Jacinto Gangestad', 'Jaclyn Fernando', 'Jamal Haugen', 'Jannette Ellinger', 'Jarod Pittmon', 'Jed Rountree', 'Jen Nath', 'Jeromy Faulkner', 'Jimmie Flannery', 'Joaquina Paulino', 'Joellen Dalman', 'Johnathon Towns', 'Judy Bran', 'Julee Woodring', 'Julius Weide', 'Kacy Klingbeil', 'Karla Pierce', 'Katheryn Monteleone', 'Kay Lintner', 'Keiko Santiago', 'Kirstin Dineen', 'Kori Fiqueroa', 'Kristie Luna', 'Kritanta Shah', 'Larraine Valone', 'Lavette Ritacco', 'Lenna Kopecky', 'Loan Alongi', 'Lorriane Koontz', 'Lorrine Mayeda', 'Louise Muszynski', 'Lupita Kilbourn', 'Madonna Foret', 'Mahakala Mallick', 'Malcom Bowes', 'Mandi Mcaninch', 'Marianela Scianna', 'Marla Theurer', 'Mathew Basch', 'May Metheny', 'Maybell Brannum', 'Mesha Mukhopadhyay', 'Monet Prioleau', 'Myrl Chenard', 'Narcisa Mcsween', 'Norene Ginsburg', 'Oda Pinon', 'Odell Warburton', 'Olene Hauck', 'Olga Hayashi', 'Otto Both', 'Patricia Welsh', 'Patsy Paras', 'Peter Atherton', 'Phil Higuchi', 'Porsche Lunn', 'Priscila Bailes', 'Quiana Heacock', 'Quinn Verhoeven', 'Ramonita Bardsley', 'Ranae Maly', 'Regan Weller', 'Russel Fahnestock', 'Sang Silverman', 'Sari Pouncy', 'Selene Thayer', 'Shandra Craner', 'Shavonne Bradly', 'Shawanna Mcmahan', 'Sherrill Rudisill', 'Shondra Andrada', 'Silvia Berning', 'Simona Furlong', 'Son Orourke', 'Sondra Bevis', 'Stasia Rapier', 'Tabatha Bale', 'Talisha Clothier', 'Tamal Pathak', 'Tasha Mondy', 'Tena Charest', 'Teofila Nickens', 'Terisa Klapp', 'Thresa Fowles', 'Toby Lebowitz', 'Tressie Crews', 'Tyron Hostetter', 'Valentina Belmont', 'Velda Sitzes', 'Verdell Lingerfelt', 'Vernell Ekhoff', 'Vivienne Kuchta', 'Voncile Davids', 'Wallace Gallion', 'Wally Rains', 'Winnifred Lehmkuhl', 'Yessenia Raposo', 'Yolando Lightcap', 'Zenaida Dicicco'];
otherNames = ['Abhinandin Prashanth', 'Abhiraja Ghoshal', 'Abhramu Sundaramoorthy', 'Aditeya Gundugollu', 'Adrienne Zimmerman', 'Agnes Jennings', 'Agnibija Saklani', 'Agnivirya Shashwat', 'Agrayani Polavarapu', 'Ahobala Diwan', 'Ajatashatru Varghese', 'Akasa Yesh', 'Akupara Surendran', 'Alan Hunt', 'Alex Potter', 'Alopa Srivathsan', 'Amaraprita Vadakke', 'Amavasya Salil', 'Amir Thimanniya', 'Amritendu Srivatsan', 'Amy Hughes', 'Anant Patterjee', 'Anasaya Sraddha', 'Andala Mahale', 'Anhati Koganti', 'Anila Pradip', 'Anima Thuraisingham', 'Anji Dinkerrai', 'Anji Shashank', 'Ankan Savdeep', 'Ankitha Pravil', 'Antonio Sutton', 'Anubha Pivari', 'Anupriya Shiladitya', 'Anuvaha Venkateswarn', 'Apaga Harku', 'Aparananda Pawan', 'Ara Rajani', 'Aubrey Perez', 'Ausinari Vaisakhi', 'Badsah Pratyush', 'Bagga Prafull', 'Bahuvirya Sachi', 'Bandhura Parvin', 'Bansuri Profulla', 'Beerud Tina', 'Beni Vasudev', 'Bennie Drake', 'Bhanupriya Labhsha', 'Bhumralkar Sughavanam', 'Bhuvanaraja Rasiah', 'Billy Mills', 'Blanca Campbell', 'Blanche Cobb', 'Bradford Reed', 'Brhat Mansey', 'Buddhimatika Namasri', 'Caksani Kumawagra', 'Carlos Santiago', 'Carmen Garner', 'Cassandra Craig', 'Casukhela Muthukumarasamy', 'Cetas Somasundara', 'Chandan Niradhara', 'Charlene Hicks', 'Charles George', 'Chris Cooper', 'Christie Mason', 'Claire Cortez', 'Clara Harrison', 'Claude Ramos', 'Clay Perkins', 'Clifton Hart', 'Cynthia Chavez', 'Dalaja Renukunta', 'Dalamodaka Shujauddin', 'Darla Martinez', 'Dasasarman Mayappan', 'Dave Mcdonald', 'Dawn Yates', 'Dean Klein', 'Debdan Sawant', 'Devanaman Subas', 'Devila Shubhabrata', 'Dharmasimha Kambhampat', 'Dhita Sunondo', 'Dhritiman Yashodhar', 'Dhyanayogi Yudhajit', 'Divya Umesh', 'Donna Ramirez', 'Doyle Rodriguez', 'Earl Webb', 'Ekadasi Suketu', 'Ekadhipati Vajpayee', 'Elbert Curry', 'Eloise Hunter', 'Emmett Reynolds', 'Eric Graves', 'Erik Holmes', 'Eta Mankad', 'Faye Copeland', 'Floyd Hardy', 'Frank Bass', 'Gajamukta Smitha', 'Garrett Townsend', 'Genevieve Black', 'Gita Macwan', 'Glen Dixon', 'Gobinda Payal', 'Gopalakrishna Perumal', 'Gopinath Pawan', 'Gordon Barnes', 'Guneeta Ramdas', 'Halima Savdeep', 'Harvey Love', 'Hector Hampton', 'Iksenya Jai', 'Iksenya Vivek', 'Ira Ruiz', 'Isabel Kennedy', 'Jack Phelps', 'Jackie Lowe', 'Jacqueline Singleton', 'Janardhan Vasudhara', 'Jaya Ulind', 'Jean Fleming', 'Jeanette Jefferson', 'Jeff Guerrero', 'Jennifer Jackson', 'Jessica Manning', 'Jessie Horton', 'Jhilmil Vivekanand', 'Joann Smith', 'Joe Morris', 'Joshua Ramsey', 'Joy Fletcher', 'Joydeep Sandeep', 'Jvalitri Ghazali', 'Kakila Nehru', 'Kalpita Shalabh', 'Kamala Mamgain', 'Kanakendu Thukral', 'Kara Shishir', 'Karin Ghemawat', 'Karmavira Shrivastava', 'Kartik Ranhotra', 'Kartikeya Prabhath', 'Karttiki Sunondo', 'Karuna Gajendra', 'Katrina Lambert', 'Kavana Veeramany', 'Kerry Abbott', 'Kirin Namasri', 'Lakshmi Mangalvedhe', 'Lewis Gutierrez', 'Lloyd Stanley', 'Loren Collins', 'Lorena Moran', 'Lorenzo Moreno', 'Lorraine Nelson', 'Luther Holland', 'Maggie Lyons', 'Mario Davis', 'Maureen Howell', 'May Hall', 'Mercedes Curtis', 'Michael Carroll', 'Michele Webster', 'Misty Ortega', 'Molly Gill', 'Myrtle Logan', 'Nadine Garza', 'Narottam Shriharsha', 'Nicholas Pena', 'Nichole Morgan', 'Noel Jimenez', 'Nora Rodriquez', 'Olive Riley', 'Pat Dennis', 'Peggy Mckenzie', 'Raul Thompson', 'Rene Cannon', 'Rohena Chidamber', 'Samantha Higgins', 'Sara Johnston', 'Shanthi Savarna', 'Shanti Pendharkar', 'Shelly Clark', 'Shri Sidda', 'Simon James', 'Sonal Gopinath', 'Suneet Pothireddy', 'Sunil Ujjaval', 'Sunit Smita', 'Tamara Dunn', 'Tami Blake', 'Traci Park', 'Wallace Day', 'Wayne Brock', 'Wilbur Phillips'];
sex = ['Male', 'Female'];
admissionYear = ['09-08', '09-10', '10-11', '11-12', '13-14', '14-15'];
group = ['Azad', 'Bhagath', 'Subhash', 'Vivek'];
examYear = ['2014-15','2013-14'];
examType = ['Test 1 (25 marks)', 'Test 2 (25 marks)', 'Midterm Exam (100 marks)', 'Test 3 (25 marks)', 'Test 4 (25 marks)', 'Final Exam (100 marks)'];
scaleRating = ['Excellent', 'Good', 'Needs to improve'];
descText = ['Can do better.', 'Congratulations. Potential to do even better.', 'Well done.'];
remarks = ['Can do better.', 'Need to work independently.', 'Well done. Concentrate on maths.', 'Good job in English and Kannada.', 'Need to work hard.', 'Need to work hard in Hindi. All the best.', 'Good work.', 'Congratulations. Potential to do even better.', 'Need assistance in languages. Well done in social.', 'Concentrate. Too playful.']
timeoffset = 13*3600; # server may be on a different TZ than where this script runs
classes = []; # we need to use the same for students and grades
for name in personNames:
  classes.append(random.randint(1,10));


#====================================================================
# Functions
#--------------------------------------------------------------------
def generateStudents(outfile):
  outfile.write("DELETE FROM `ek5d2_studentform`;\n");
  outfile.write("INSERT INTO `ek5d2_studentform` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `name`, `dateOfBirth`, `sex`, `admissionNumber`, `studentUid`, `class`, `group`, `parent`, `guardian`) VALUES\n");

  random.shuffle(personNames);
  for i in range(len(personNames)):
    birthDate = random.randint(1,28);
    if (birthDate<10):
      birthDate = '0'+str(birthDate);
    birthMonth = random.randint(1,12);
    if (birthMonth<10):
      birthMonth = '0'+str(birthMonth);
    birthYear = str(random.randint(1998,2009));
    uid = 'A000';
    if (i<9):
      uid = uid[:4]+str(i+1);
    elif (i<99):
      uid = uid[:3]+str(i+1);
    else:
      uid = uid[:2]+str(i+1);

    fields = [];
    fields.append(str(i+1));
    fields.append("");
    fields.append("40");
    fields.append(str(datetime.datetime.now()-datetime.timedelta(seconds=timeoffset))[:19]);
    fields.append("NULL");
    fields.append(personNames[i]);
    fields.append(str(birthDate)+'/'+str(birthMonth)+'/'+birthYear);
    fields.append(random.choice(sex));
    fields.append(str(i+1)+'/'+random.choice(admissionYear));
    fields.append(uid);
    fields.append(str(classes[i]));
    fields.append(random.choice(group));
    if (random.randint(0,1)):
      fields.append("");
      fields.append(random.choice(otherNames));
    else:
      fields.append(random.choice(otherNames));
      fields.append("");

    line = "('" + "', '".join(fields) + "'),";
    if (i==len(personNames)-1):
      line = re.sub(r',$', ";", line);
    outfile.write(line + '\n');
  

def generateGrades(outfile):
  outfile.write("DELETE FROM `ek5d2_gradesform`;\n");
  outfile.write("INSERT INTO `ek5d2_gradesform` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `class`, `studentId`, `year`, `examType`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`) VALUES\n");

  names = personNames; # make a copy since we are going to edit it
  random.shuffle(examType);
  
  print("Skipping grades for", names.pop(), "["+str(len(names)+1)+"]");
  
  totalPossibleRecords = len(examType)*len(names)*len(examYear);
  uniqueIndex = totalCount = 0;
  skipStudentOneYear = random.randint(0,len(names)-1);
  for i in range(len(examType)):
    maxMarks = int(re.sub(r'.*\((\d+) marks.*', "\\1", examType[i]));
    for j in range(len(names)):
      if (random.randint(0,99) == 0): # skip 1%, skip this person for this examType
        print("Skipping grades for", names[j], "["+str(j+1)+"]: all years,", examType[i]);
        totalCount += len(examYear);
        continue;
      for k in range(len(examYear)):
        if (j==skipStudentOneYear and k==0):
          if (i==0):
            print("Skipping grades for", names[j], "["+str(j+1)+"]:", examYear[k], ", all exams");
          totalCount += 1;
          continue;

        totalCount += 1;
        if ((random.randint(0,9) > 0 or                 # skip 10%
             totalCount==totalPossibleRecords) and      # to keep end code simple: semi-colon termination
             not(classes[j]==1 and k>0)):               # no grades for prev years, if current year is class 1
          fields = []; uniqueIndex += 1;
          fields.append(str(uniqueIndex));
          fields.append("");
          fields.append("40");
          currdatetime = datetime.datetime.now()-datetime.timedelta(seconds=timeoffset);
          fields.append(str(currdatetime-datetime.timedelta(seconds=random.randint(3700*25*0.5,3700*25*5.5)))[:19]);
          if(random.randint(0,9) > 1): # skip 10%
            fields.append(str(currdatetime)[:19]);
          else:
            fields.append("");
          fields.append(str(classes[j]-k));
          fields.append(str(j+1));
          fields.append(examYear[k]);
          fields.append(examType[i]);
          if(random.randint(0,99) < 1): # skip 1% all data
            print("Skipping optional items in grades ["+str(uniqueIndex)+"] for", names[j], "["+str(j+1)+"]:", examYear[k], ",", examType[i]);
            for l in range(11):
              fields.append("");
          else:
            for l in range(6):
              fields.append(generateGrade(maxMarks));
            if(classes[j]-k>=6 and random.randint(0,19) > 1): # skip 5%; computerScience for only for class 6 and above
              fields.append(generateGrade(maxMarks));
            else:
              fields.append("");          
            if(random.randint(0,19) > 1): # skip 5%
              fields.append(random.choice(scaleRating));
            else:
              fields.append("");          
            if(random.randint(0,19) > 1): # skip 5%
              fields.append(random.choice(scaleRating));
            else:
              fields.append("");          
            if(random.randint(0,19) > 1): # skip 5%
              fields.append(str(random.randint(26,36)) + '/36');
            else:
              fields.append("");          
            if(random.randint(0,19) > 1): # skip 5%
              fields.append(random.choice(remarks));
            else:
              fields.append("");          
          
          line = "('" + "', '".join(fields) + "'),";
          if (totalCount==totalPossibleRecords):
            line = re.sub(r',$', ";", line);
          outfile.write(line + '\n');


def generateGrade(maxMarks):
  if (random.randint(0,19) > 0): # skip 5%
    return str(int(random.randint(25,100)*maxMarks/100));
  return "";


def generateSponsors(outfile):
  outfile.write("DELETE FROM `ek5d2_sponsorform`;\n");
  outfile.write("INSERT INTO `ek5d2_sponsorform` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `name`, `sponsorUid`, `sponsoredStudents`) VALUES\n");

  sponsoredCount = collections.defaultdict(int)
  random.shuffle(otherNames);
  for i in range(len(otherNames)):
    uid = 'M000';
    if (i<9):
      uid = uid[:4]+str(i+1);
    elif (i<99):
      uid = uid[:3]+str(i+1);
    else:
      uid = uid[:2]+str(i+1);
    fields = [];
    fields.append(str(i+1));
    fields.append("");
    fields.append("40");
    fields.append(str(datetime.datetime.now()-datetime.timedelta(seconds=timeoffset))[:19]);
    fields.append("NULL");
    fields.append(otherNames[i]);
    fields.append(uid);
    sponsored = random.sample(range(0,len(personNames)),int(abs(random.gauss(1.8,0.7))));
    for s in sponsored:
    	sponsoredCount[s] += 1;
    sponsored = [s for s in sponsored if sponsoredCount[s]<=3]
    fields.append(",".join(map(str,sponsored)));

    line = "('" + "', '".join(fields) + "'),";
    if (i==len(otherNames)-1):
      line = re.sub(r',$', ";", line);
    outfile.write(line + '\n');


#====================================================================
# Main Processing
#--------------------------------------------------------------------
outfile = open('testData.sql', 'w')
generateStudents(outfile);
generateGrades(outfile);
generateSponsors(outfile);
