package ua.alexshent.storage;

import java.util.Optional;
import java.util.UUID;

public interface Dao<T> {
    void create(T t);
    Optional<T> read(UUID id);
    void update(T t);
    void delete(UUID id);
}
