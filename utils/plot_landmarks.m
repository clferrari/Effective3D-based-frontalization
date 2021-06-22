function  plot_landmarks( img, landImage,style,enum )

imshow(img);
hold on
if size(landImage,2) == 2
    if enum
        for l = 1:size(landImage,1)
            plot(landImage(l,1),landImage(l,2),style);
            text(landImage(l,1),landImage(l,2),num2str(l),'Color','m')
        end
        
    else
        plot(landImage(:,1),landImage(:,2),style);
        
    end
    
else
    if enum
        for l = 1:size(landImage,2)
            plot(landImage(1,l),landImage(2,l),style);
            text(landImage(1,l),landImage(2,l),num2str(l))
        end
        
    else
        plot(landImage(1,:),landImage(2,:),style);
    end
end

end
