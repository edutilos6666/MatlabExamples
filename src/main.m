intro;
session1;
waitforbuttonpress;


clf
axis off
axis([0 20 0 20]);
t = text(0,20, '<<Session 2>>');
t.FontSize  = 20 ;
text(0, 18, 'In this session spider pictures will be shown.');
t = text(0, 10, 'Press any key if you are ready to start!');
waitforbuttonpress;


session2;
waitforbuttonpress;


clf
axis off
axis([0 20 0 20]);
t = text(0,20, '<<Session 3>>');
t.FontSize  = 20 ;
text(0, 18, 'In this session car pictures will be shown.');
t = text(0, 10, 'Press any key if you are ready to start!');
waitforbuttonpress;


session3;