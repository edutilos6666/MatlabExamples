function  analyze_data(res, title_str, outfile)
    delta = 50;
    raw = zeros(11, 2);
    for n = 1:size(res,1)
        s1 = 0 ;
        s2 = 0 ;
        for x = 1:(n-1)
            s1 = s1 + res(x,1);
            s2 = s2 + res(x,2);
        end
        
        raw(n, 1)= delta - s1 ;
        raw(n, 2) = delta -s2 ;
    end
    
    raw(11, 1) = 0;
    raw(11, 2) = 0 ;
    
    all = zeros(11, 2);
    for n = 1:size(res,1)
        s1 = 0 ;
        s2 = 0 ;
        for x = 1:(n-1)
            s1 = s1 + res(x,1);
            s2 = s2 + res(x,2);
        end
        
        all(n, 1) = (delta - s1) / delta;
        all(n,2 ) = (delta - s2) / delta;
    end
    
    save(outfile, 'raw', 'all');
    all(11, 1) = 0 ;
    all(11 , 2) = 0 ;
    disp(all);
    
    figure;
    plot(all(:,1), all(:,2));
    hold on ;
    values = linspace(0, 1, 50);
    % plot(all(:,1), all(:,1), '.');
    plot(values, values , '.black');
    title(title_str);
    xlabel('False Alarm Rate');
    ylabel('Hit Rate');
end

