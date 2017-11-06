function intro
    %intro Summary of this function goes here
    %   Detailed explanation goes here
    
    % Here I print with text() some instructions , it is handy for them
    % to get acquianted with the requirements of this experiment.
    clf
    axis off
    axis([0 20 0 20]);
    
    t = text(0,20, '<<About the experiment>>');
    t.FontSize  = 20 ;
    t = text(0, 18, 'This experiment consists of 3 sessions:'); 
    text(0, 17, '- In the first session human face pictures will be shown.'); 
    text(0,16, '- In the second session spider pictures will be shown.'); 
    text(0,15, '- In the third session car pictures will be shown.'); 
    t = text (0 , 14 , 'In each session you will be shown 50 unique pictures');
    t.FontSize  = 10 ;
    text (0 , 13 , 'and you have to memorize as many pictures as you can.');
    text(0, 12, 'Later you will be asked 100 times if a specific picture was already');
    text(0, 11, 'shown.');
    text (0 , 5 , 'Press any key/button to start with the first session');
    waitforbuttonpress;

end


