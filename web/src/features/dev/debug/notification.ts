import { NotificationProps } from '../../../typings';
import { debugData } from '../../../utils/debugData';

export const debugCustomNotification = () => {
  debugData<NotificationProps>([
    {
      action: 'notify',
      data: {
        title: 'Success',
        description: 'Opis powiadomienia',
        type: 'success',
        id: 'pogchamp',
        duration: 20000,
      },
    },
  ]);
  debugData<NotificationProps>([
    {
      action: 'notify',
      data: {
        title: 'Error',
        description: 'Opis powiadomienia',
        type: 'error',
        duration: 20000,
      },
    },
  ]);
  debugData<NotificationProps>([
    {
      action: 'notify',
      data: {
        title: 'Custom icon success',
        description: 'Opis powiadomienia',
        type: 'success',
        duration: 20000,
        icon: 'microchip',
        showDuration: false,
      },
    },
  ]);
};
