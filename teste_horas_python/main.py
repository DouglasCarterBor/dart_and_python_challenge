def main():
    try:
        with open('Horas.txt', 'r') as file:
            lines = file.readlines()

        total_hours = 0
        total_minutes = 0
        total_seconds = 0

        for line in lines:
            duration_parts = line.split()

            hours_index = duration_parts.index('h') if 'h' in duration_parts else -1
            minutes_index = duration_parts.index('min') if 'min' in duration_parts else -1
            seconds_index = duration_parts.index('s') if 's' in duration_parts else -1

            if hours_index != -1 and minutes_index != -1:
                hours = int(duration_parts[hours_index - 1])
                minutes = int(duration_parts[minutes_index - 1])

                total_hours += hours
                total_minutes += minutes

            if seconds_index != -1:
                seconds = int(duration_parts[seconds_index - 1])
                total_seconds += seconds

        total_minutes += total_seconds // 60
        total_seconds %= 60
        total_hours += total_minutes // 60
        total_minutes %= 60

        print(f'Tempo total: {total_hours} h {total_minutes} min {total_seconds} s')

    except Exception as e:
        print(f'Ocorreu um erro: {e}')

if __name__ == "__main__":
    main()
