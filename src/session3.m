% In this session car pictures will be shown to the participants.
% All participant's decision in relation to the specific picture will be
% saved into img_tracker variable. At the end of the session important
% variables will be saved into session3.mat file and FA rate , Hit rate (in
% 2 forms: raw(with name raw) and percentage(with name all) in external
% function analyze_data will be saved into session3_analysis.mat file.
function session3
    outfile = 'session3.mat';
    size1 = 100;
    size2 = 50;
    % for examle img_tracker(100, :)  => 1 4
    % means that img images/cars/100.jpg was perceived by the participant as
    % an old image (1) and with confidence level 4
    %
    % img_tracker(100, :)  => 0 4
    % means that img images/cars/100.jpg was perceived by the participant as
    % a new image (0) and with confidence level 4
    img_tracker = zeros(100, 2);
    all_images = session3_part1(size1, size2);
    old_images = all_images(1:size2,1);
    new_images = all_images(size2+1:100,1);
    
    old_images2 = old_images(randperm(size2, size2));
    new_images2 = new_images(randperm(size2, size2));
    all_images2 = [old_images2;new_images2];
    all_images2 = all_images2(randperm(size1, size1));
    
    
    [user_new, user_old] = session3_part2(all_images2);
    res = session3_part3(old_images, user_new, user_old);
    disp(res);
    title_str = 'ROC Curve for car pictures';
    analyze_data(res, title_str, 'session3_analysis.mat');
    
    function res = session3_part1(size1, size2)
        res = randperm(size1 , size1)';
        
        for n=1:size2
            img_name = strcat('images/cars/',int2str(res(n,1)),'.jpg');
            img = imread(img_name);
            img_gray = rgb2gray(img);
            imshow(img_gray);
            pause(0.0001);
        end
    end
    
    
    function [user_new, user_old] = session3_part2(all_images)
        size1 = size(all_images,1);
        user_old = zeros(size1, 1);
        user_new = zeros(size1, 1);
        counter_old = 0;
        counter_new = 0;
        
        % Here after showing all 50 pictures , participant can prepare
        % himself/herself to test his/her memory. Basically , when he/she feels
        % ready , he/she can press any key to proceed with the experiment.
        clf
        axis off
        axis([0 20 0 20]);
        t = text(0,20, 'Are you ready?');
        t.FontSize  = 20 ;
        t = text(0, 18, 'If you have seen the image type 1,otherwise type 0.');
        t.FontSize = 10 ;
        t = text(-2, 15, 'Press any key if you are ready to start!');
        t.FontSize  = 20 ;
        waitforbuttonpress;
        
        
        
        
        
        for n=1:size1
            img_name = strcat('images/cars/',int2str(all_images(n,1)),'.jpg');
            img = imread(img_name);
            img_gray = rgb2gray(img);
            imshow(img_gray);
            waitforbuttonpress;
            input = get(gcf , 'CurrentCharacter');
            input = str2double(input);
            if input == 1
                counter_old = counter_old + 1;
                user_old(counter_old,1) = all_images(n,1);
                % flag this image as old in img_tracker
                img_tracker(n, 1) = 1;
            elseif input == 0
                counter_new = counter_new + 1;
                user_new(counter_new,1) = all_images(n,1);
                % flag this image as new in img_tracker
                img_tracker(n,1) = 0;
            end
            
        end
        
        
        user_old = user_old(1:counter_old);
        user_new = user_new(1:counter_new);
        
    end
    
    
    
    function [res] = session3_part3(old_images , user_new, user_old)
        
        res = zeros(10, 2);
        
        % iterating over user_new
        clf
        axis off
        axis([0 20 0 20]);
        t = text(0,20, 'Iterating over new images');
        t.FontSize  = 10 ;
        text(0, 18 , 'Assign confidence level from 5 to 1');
        text(0, 16, '5 means "sure new", ..., 1 means "not sure new"' );
        waitforbuttonpress;
        for n = 1:size(user_new)
            img_name = strcat('images/cars/',int2str(user_new(n,1)),'.jpg');
            img = imread(img_name);
            img_gray = rgb2gray(img);
            imshow(img_gray);
            
            waitforbuttonpress;
            input = get(gcf , 'CurrentCharacter');
            confidence_level = str2double(input);
            % add confidence level into img_tracker
            index_for_tracker = find(all_images2 == user_new(n,1));
            img_tracker(index_for_tracker, 2) = confidence_level;
            index  = 6 - confidence_level;
            if sum(old_images == user_new(n,1)) == 1
                % increment target
                res(index,2) = res(index,2) + 1;
            else
                % increment lure
                res(index, 1) = res(index, 1) + 1;
            end
            
            
        end
        
        
        
        
        
        % iterating over user_old
        clf
        axis off
        axis([0 20 0 20]);
        t = text(0,20, 'Iterating over old images');
        t.FontSize  = 10 ;
        text(0, 18 , 'Assign confidence level from 5 to 1');
        text(0, 16, '5 means "sure old", ..., 1 means "not sure old"' );
        waitforbuttonpress;
        for n = 1:size(user_old)
            img_name = strcat('images/cars/',int2str(user_old(n,1)),'.jpg');
            img = imread(img_name);
            img_gray = rgb2gray(img);
            imshow(img_gray);
            
            waitforbuttonpress;
            input = get(gcf , 'CurrentCharacter');
            confidence_level = str2double(input);
            % add confidence level into img_tracker
            index_for_tracker = find(all_images2 == user_old(n,1));
            img_tracker(index_for_tracker, 2) = confidence_level;
            
            index = 10 - confidence_level + 1 ;
            if sum(old_images == user_old(n,1)) == 1
                % increment target
                res(index,2) = res(index,2) + 1;
            else
                % increment lure
                res(index, 1) = res(index, 1) + 1;
            end
            
            
        end
    end
    
    
    save(outfile, 'all_images', 'old_images', 'new_images','all_images2', 'old_images2', 'new_images2', 'user_new', 'user_old', 'res', 'img_tracker');
    
end