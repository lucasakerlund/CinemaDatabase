CALL create_salon(44);
CALL create_salon(44);

INSERT INTO `prices` VALUES ("adult_ticket", 120);
INSERT INTO `prices` VALUES ("child_ticket", 80);
INSERT INTO `prices` VALUES ("senior_ticket", 90);
INSERT INTO `prices` VALUES ("student_ticket", 100);

INSERT INTO `genres` VALUES(1, "ACTION");
INSERT INTO `genres` VALUES(2, "KOMEDI");
INSERT INTO `genres` VALUES(3, "ÄVENTYR");
INSERT INTO `genres` VALUES(4, "DRAMA");
INSERT INTO `genres` VALUES(5, "ROMANTIK");
INSERT INTO `movies` VALUES(1, "Spider-Man", "Detta är en spiderman film", 13, "https://upload.wikimedia.org/wikipedia/en/b/bd/Spider-Man_Far_From_Home_poster.jpg", "https://www.filmtopp.se/media/2019/05/spider-man-far-from-home-featured-min.jpg?w=810&fit=max&s=5c28cc07814f135104cc0ec2950166a1");
INSERT INTO `movies` VALUES(2, "Sharknado", "När en galen orkan översvämmar Los Angeles styr naturens dödligaste mördare hav, land och luft när tusentals hajar terroriserar den vattensjuka befolkningen.", 13, "https://m.media-amazon.com/images/M/MV5BODcwZWFiNTEtNDgzMC00ZmE2LWExMzYtNzZhZDgzNDc5NDkyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg", "https://image.tmdb.org/t/p/original/xmBJ9nezUteqowdYfrW8383LHd9.jpg");
INSERT INTO `movies` VALUES(3,
							"Titanic",
                            "En sjuttonårig aristokrat blir förälskad i en snäll men fattig artist ombord på den lyxiga, olyckliga RMS Titanic.",
                            13,
                            "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_.jpg",
                            "https://c4.wallpaperflare.com/wallpaper/970/201/126/titanic-movie-wallpaper-preview.jpg");
INSERT INTO `movies` VALUES(4,
							"BAD BOYS",
                            "Två höftdetektiver skyddar ett vittne till ett mord medan de utreder ett fall av stulet heroin från bevisförrådet från deras polisområde.",
                            15,
                            "https://m.media-amazon.com/images/M/MV5BMWU0MGYwZWQtMzcwYS00NWVhLTlkZTAtYWVjOTYwZTBhZTBiXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg",
                            "https://pro2-bar-s3-cdn-cf5.myportfolio.com/9cf59961cbd8e65904e2e455ea57ebf6/63abd8eb-0970-40ca-b08b-49bfe7959a04_rw_1920.jpg?h=1b267ac85ab26567288a76c88f768ce6");
INSERT INTO `movies` VALUES(5,
							"Batman: The Dark Knight",
                            "Två höftdetektiver skyddar ett vittne till ett mord medan de utreder ett fall av stulet heroin från bevisförrådet från deras polisområde.",
                            15,
                            "https://www.themoviedb.org/t/p/original/pMxR4Z2qU7l8KmDCNQPPq9lqyGb.jpg",
                            "https://www.vintagemovieposters.co.uk/wp-content/uploads/2015/01/IMG_5848.jpeg");

INSERT INTO `movie_genres` VALUES(1, 1);
INSERT INTO `movie_genres` VALUES(1, 2);
INSERT INTO `movie_genres` VALUES(2, 2);
INSERT INTO `movie_genres` VALUES(2, 3);
INSERT INTO `movie_genres` VALUES(3, 4);
INSERT INTO `movie_genres` VALUES(3, 5);
INSERT INTO `movie_genres` VALUES(4, 1);
INSERT INTO `movie_genres` VALUES(4, 2);
INSERT INTO `movie_genres` VALUES(2, 1);
INSERT INTO `movie_genres` VALUES(5, 1);
INSERT INTO `movie_genres` VALUES(5, 4);

INSERT INTO `schedule` VALUES(1, "2022-05-24", "09:40", 1, 1);
INSERT INTO `schedule` VALUES(2, "2022-05-24", "09:40", 4, 1);
INSERT INTO `schedule` VALUES(4, "2022-04-28", "13:20", 2, 2);
INSERT INTO `schedule` VALUES(5, "2022-02-28", "13:20", 2, 2);
INSERT INTO `schedule` VALUES(6, "2022-04-28", "13:20", 2, 2);

INSERT INTO `customers` VALUES(1, "Lucas", "200110171234", "lucas@hotmail.se");
INSERT INTO `customers` VALUES(2, "Lucas", "200110171237", "lucas@hotmail.se");

CALL book_ticket(1, 0, 0, 0, 0, 1 ,"1,2,3,4,5,6");
CALL book_ticket(1, 0, 0, 0, 0, 1 ,"9,11");
CALL book_ticket(1, 0, 0, 0, 0, 2 ,"1,2,3,4");

INSERT INTO `staffs` VALUES (1, "Bob", 199901011234, "some@mail.com", "adress", 1000, "Städare");
INSERT INTO `staffs` VALUES (2, "Lennart", 199801011234, "someother@mail.com", "another adress", 2000, "Rengörare");

INSERT INTO `staff_schedules` VALUES (1, "2022-04-11", "11:00", "städa");
INSERT INTO `staff_schedules` VALUES (1, "2022-04-12", "12:00", "städa");
INSERT INTO `staff_schedules` VALUES (1, "2022-04-13", "13:00", "städa");
INSERT INTO `staff_schedules` VALUES (1, "2022-04-14", "14:00", "städa");